package com.book.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = AccountValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface AccountConstraint {
    String message() default "Email đã có người đăng ký";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
