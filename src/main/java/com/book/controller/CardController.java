package com.book.controller;

import com.book.model.Book;
import com.book.model.Item;
import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CardController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;

    List<Item> cart = new ArrayList<>();

    @RequestMapping("")
    public String cart(ModelMap mm) {
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "cart";
    }

    @ResponseBody
    @RequestMapping("/getCart")
    public List<Item> getCart(HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        return cart;
    }

    @RequestMapping("/addCart")
    @ResponseBody
    public StringBuilder addCart(@RequestParam(required = false) Integer id,
                                 HttpSession session) {
        StringBuilder html = new StringBuilder();

        Book book = bookService.getBookById(id);
        if (session.getAttribute("cart") == null) {
            cart.add(new Item(book, 1));
            session.setAttribute("cart", cart);
        } else {
            this.cart = (List<Item>) session.getAttribute("cart");
            int index = this.exists(id, cart);
            if (index == -1) {
                cart.add(new Item(book, 1));
            } else {
                int quantityNew = this.cart.get(index).getQuantity() + 1;
                this.cart.get(index).setQuantity(quantityNew);
            }
            session.setAttribute("cart", this.cart);
        }
        int subtotal = 0;

        html.append("<div id=\"cart_container\" class=\"cart_container\">");
        html.append("<div class=\"block\" id=\"module_productscart\">");
        html.append("<div id=\"showempty\"></div>");
        html.append("<div class=\"blockcontent\"  id=\"showcart\">");
        html.append("<div class=\"cartintro\">Bạn có <span class=\"shownumber\">" + cart.size() + "</span> sản phẩm trong giỏ</div>");
        html.append("<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">");
        html.append("<tr>");
        html.append("<td colspan=\"2\">");
        html.append("<table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" id=\"thtitle\">");
        html.append("<tr>");
        html.append("<th width=\"40%\" colspan=\"2\" align=\"left\">Sản phẩm trong giỏ</th>");
        html.append("<th width=\"20%\" align=\"right\">Giá bán</th>");
        html.append("<th width=\"20%\" align=\"right\">Số lượng</th>");
        html.append("<th width=\"20%\" align=\"right\">Thành tiền</th>");
        html.append("</tr>");
        html.append("</table>");
        html.append("<div class=\"showboxcart\" id=\"contentcart\">");
        html.append("<table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" class=\"productscart\">");
        for (int i = 0; i < cart.size(); i++) {
            subtotal += cart.get(i).getBook().getPriceNew() * cart.get(i).getQuantity();
            html.append("<tr id=\"cam178202\">");
            html.append("<td>" +
                    "<img src=\"/" + cart.get(i).getBook().getImage() + "\" width=\"40\" height=\"50\" alt=\"" + cart.get(i).getBook().getName() + "\" />" +
                    " </td>");
            html.append("<td>");
            html.append("<div class=\"productname\">");
            html.append("<a href=\"/#\" title=\"" + cart.get(i).getBook().getName() + "\">" + cart.get(i).getBook().getName() + "</a>");
            html.append("</div>");
            html.append("</td>");
            html.append("<td align=\"right\" width=\"20%\">");
            html.append("<div class=\"sprice\" id=\"price" + cart.get(i).getBook().getId() + "\">" + cart.get(i).getBook().getPriceNew() + " ₫</div>");
            html.append("</td>");
            html.append("<td class=\"quantity\" align=\"right\" width=\"20%\">");
            html.append("<input name=\"quantity" + cart.get(i).getBook().getId() + "\" onkeydown=\"validateUserInput();\" type=\"text\" size=\"3\" maxlength=\"3\" class=\"small\" value=\"" + cart.get(i).getQuantity() + "\" onkeyup=\"changequantity(" + cart.get(i).getBook().getId() + ", this.value);\" onblur=\"changequantity(" + cart.get(i).getBook().getId() + ", this.value);\" autocomplete=\"off\">");
            html.append("<div style=\"padding-right:15px\">");
            html.append("<a href=\"javascript:\" onclick=\"changequantity(2, 2898, 0, 178202);\">Xóa</a>");
            html.append("</div>");
            html.append("</td>");
            html.append("<td align=\"right\" width=\"20%\">");
            html.append("<span id=\"cart-intomoney"+cart.get(i).getBook().getId()+"\">" + cart.get(i).getBook().getPriceNew() * cart.get(i).getQuantity() + " ₫</span>");
            html.append("</td>");
            html.append("</tr>");
        }
        html.append("</table>");
        html.append("</div>");
        html.append("<table cellpadding=\"2\" cellspacing=\"1\" width=\"100%\">");
        html.append("</tr>");
        html.append("<td width=\"70%\">");
        html.append("<table width=\"100%\" id=\"displayform\" >");
        html.append("<tr>");
        html.append("<td rowspan=\"2\">Mã giảm giá</td>");
        html.append("<td  rowspan=\"2\" width=\"80%\" id=\"couponform\">");
        html.append("<form id=\"coupon\" action=\"/orders/updatecoupon/index.html\" onsubmit=\"submitform(this); return false;\">");
        html.append("<input type=\"text\" placeholder=\"Nhập mã nếu có\" name=\"couponcode\"  />");
        html.append("<input type=\"submit\" class=\"bluebuttom\" value=\"Áp dụng\" />");
        html.append("</form>");
        html.append("<span id=\"ajaxresultload\"></span>");
        html.append("</td>");
        html.append("</tr>");
        html.append("</table>");
        html.append("</td>");
        html.append("<td>");
        html.append("<table width=\"100%\">");
        html.append("</tr>");
        html.append("<td class=\"cardtool\"><b>Tổng tiền:</b></td>");
        html.append("<td class=\"cart-subtotal cardtool\">");
        html.append("<span id=\"cart-subtotal\">"+subtotal+" ₫</span>");
        html.append("</td>");
        html.append("</tr>");
        html.append("<tr id=\"couponvalue\"  style=\"display:none\">");
        html.append("<td class=\"cardtool\">");
        html.append("<b>Ưu đãi</b>");
        html.append("</td>");
        html.append("<td class=\"cart-subtotal cardtool\">\n" +
                "                                <span id=\"cart-coupon\">0 ₫</span>\n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                        <tr>\n" +
                "                        \t<td colspan=\"2\" style=\"border-bottom:1px solid #ccc\"></td>\n" +
                "                        </tr>\n" +
                "                        <tr>\n" +
                "                            <td class=\"cardtool\">\n" +
                "                                <b>Thành tiền:</b>\n" +
                "                             </td>\n" +
                "                            <td class=\"cart-subtotal cardtool\">\n" +
                "                                <span id=\"cart-total\"><b>"+subtotal+" ₫</b></span>\n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                    </table>\n" +
                "                    </td>\n" +
                "                </tr>\n" +
                "                <tr class=\"actions\">\n" +
                "                    <td>\n" +
                "                    <a href=\"javascript:\" class=\"continue\" onclick=\"Boxy.get(this).hide();\">\n" +
                "                        <i class=\"fa fa-play\"></i> Thêm sản phẩm khác vào giỏ hàng</a>\n" +
                "                    </td>\n" +
                "                    <td align=\"right\" style=\"padding-top:10px;\">\n" +
                "                    <a href=\"/orders/checkout/index.html\" class=\"redbuttom\">Thực hiện thanh toán</a>\n" +
                "                    </td>\n" +
                "                </tr>\n" +
                "            </table>\n" +
                "            </td>\n" +
                "         </tr>\n" +
                "     </table>\n" +
                "     </div>\n");
        html.append("<script type=\"text/javascript\">\n" +
                "\tvar loading = '<img src=\"http://nobita.vn/layouts/system/images/loading.gif\" border=\"0\" />';\t\n" +
                "\tfunction validateUserInput()\n" +
                "\t{\n" +
                "\t\tvar code = this.event.keyCode;\n" +
                "\t\tif ((code < 48 || (code > 57 && code < 96) || code > 105) && code!==46&&code!==8&&code!==37&&code!==39) \n" +
                "\t\t{\n" +
                "\t\t\tthis.event.preventDefault();      \n" +
                "\t\t}\n" +
                "\t}\n" +
                "\t\n" +
                "function changequantity(id, value)\n" +
                "\t{\n" +
                "\t\turl = addQuery('/cart/changeCart', 'id=' + id);\n" +
                "\t\turl = addQuery(url, 'value=' + value);\t\n" +
                "\t\t$.ajax({\n" +
                "\t\t\tdataType: \"json\",\n" +
                "\t\t\turl: url,\n" +
                "\t\t\tsuccess: function (data, status)\n" +
                "\t\t\t{\n" +
                "console.log(data);"+
                "\t\t\t\tsubtotal = data.subtotal;\n" +
                "\t\t\t\tintomoney =  data.intomoney;\n" +
                "\t\t\t\ttotalam = data.totalam;\n" +
                "\t\t\t\t\n" +
                "\t\t\t\t$(\"#cart-intomoney\"+id).empty();\n" +
                "\t\t\t\t$(\"#cart-intomoney\"+id).append(intomoney);\n" +
                "\t\t\t\t$(\"#cart-subtotal\").empty();\n" +
                "\t\t\t\t$(\"#cart-subtotal\").append(subtotal);\n" +
                "\t\t\t\t$(\"#cart-total b\").empty();\n" +
                "\t\t\t\t$(\"#cart-total b\").append(totalam);\n" +
                "\t\t\t\t\n" +
                "\t\t\t\tif(value == 0)\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\tcount = data.count;\n" +
                "\t\t\t\t\t$('#cam').remove();\t\t\t\t\n" +
                "\t\t\t\t\tif(subtotal == '')\n" +
                "\t\t\t\t\t{\n" +
                "\t\t\t\t\t\t$('#showempty').empty();\n" +
                "\t\t\t\t\t\t$('#showempty').append('<div class=\"empty\">Giỏ hàng chưa có sản phẩm</div>');\n" +
                "\t\t\t\t\t\t$('#showcart').empty();\n" +
                "\t\t\t\t\t}\n" +
                "\t\t\t\t\telse\n" +
                "\t\t\t\t\t{\n" +
                "\t\t\t\t\t\t$('.subcontent .total b').empty();\n" +
                "\t\t\t\t\t\t$('.subcontent .total b').append(data.subtotal);\n" +
                "\t\t\t\t\t}\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\tgetcartnumber();\n" +
                "\t\t\t\t}\n" +
                "\t\t\t},\n" +
                "\t\t});\n" +
                "\t}\n" +
                "</script>\n" +
                "</div>\n" +
                "</div>");
        return html;
    }

    public int exists(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getBook().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping("/changeCart")
    @ResponseBody
    public Map<String, Integer> changequantity(@RequestParam Integer id,
                                               @RequestParam Integer value,
                                               HttpSession session
    ) {
        Map<String, Integer> data = new HashMap<>();
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = exists(id, cart);
        cart.get(index).setQuantity(value);
        int cartIntoMoney = cart.get(index).getQuantity() * cart.get(index).getBook().getPriceNew();
        int subtotal = 0;
        for (int i = 0; i < cart.size(); i++) {
            subtotal += cart.get(i).getBook().getPriceNew() * cart.get(i).getQuantity();
        }
        data.put("subtotal", subtotal);
        data.put("intomoney", cartIntoMoney);
        data.put("totalam", subtotal);
        data.put("count", cart.size());
        return data;
    }
}
