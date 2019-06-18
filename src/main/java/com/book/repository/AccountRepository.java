package com.book.repository;

import com.book.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByEmail(String email);

    Account findAllByEmailAndPassword(String email, String password);

    Account findByResetToken(String resetToken);
}
