package com.book.service;

import com.book.model.Account;
import com.book.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
    @Autowired
    AccountRepository accountRepository;

    public Account findByEmail(String email) {
        return accountRepository.findByEmail(email);
    }

    public Account getAccount(String email, String password) {
        return accountRepository.findAllByEmailAndPassword(email, password);
    }

    public Account addAccount(Account account) {
        return accountRepository.save(account);
    }
}
