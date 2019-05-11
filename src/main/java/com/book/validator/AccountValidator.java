package com.book.validator;

import com.book.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class AccountValidator implements ConstraintValidator<AccountConstraint, String> {

    @Autowired
    AccountService accountService;

    @Override
    public void initialize(AccountConstraint constraintAnnotation) {
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        System.out.println(value);
        if(accountService.findByEmail(value) == null) {
            System.out.println("Sai");
            return true;
        }
        System.out.println("Đúng");
        return false;
    }
}
