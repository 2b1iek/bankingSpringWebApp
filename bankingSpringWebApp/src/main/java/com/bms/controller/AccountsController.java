package com.bms.controller;

import com.bms.dao.AccountsDao;
import com.bms.model.Accounts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;




@Controller
public class AccountsController {

    @Autowired
    private AccountsDao accountsDao;

    // ======= HOME: Show all accounts =======
    @RequestMapping("/")
    public String getIndexPage(Model model) {
        model.addAttribute("accountsList", accountsDao.getAllAccounts());
        return "index"; // index.jsp will show the table
    }

    // ======= SHOW ADD FORM =======
    @GetMapping("/addAccount")
    public String showAddForm(Model model) {
        model.addAttribute("account", new Accounts());
        return "add_account"; // add_account.jsp
    }

    // ======= SAVE NEW ACCOUNT =======
    @PostMapping("/saveAccount")
    public String saveAccount(@ModelAttribute("account") Accounts acc) {
        if (acc.getAccountSetupDate() == null) {
            acc.setAccountSetupDate(LocalDate.now());
        }
        accountsDao.insertAccount(acc);
        return "redirect:/"; // Go back to list
    }

    // ======= SHOW EDIT FORM =======
    @GetMapping("/editAccount/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Accounts acc = accountsDao.getAccountById(id);
        model.addAttribute("account", acc);
        return "edit_account"; // edit_account.jsp
    }

    // ======= UPDATE ACCOUNT =======
    @PostMapping("/updateAccount")
    public String updateAccount(@ModelAttribute("account") Accounts updated) {
        accountsDao.updateAccountById(updated, updated.getAccountId());
        return "redirect:/";
    }

    // ======= DELETE ACCOUNT =======
    @GetMapping("/deleteAccount/{id}")
    public String deleteAccount(@PathVariable("id") int id) {
        accountsDao.deleteAccountById(id);
        return "redirect:/";
    }

    // ======= SEARCH ACCOUNT =======
    @GetMapping("/search")
    public String searchAccounts(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("accountsList", accountsDao.searchAccountsByKeyword(keyword));
        return "index"; // reuse index.jsp for search results
    }
    
 // Convert yyyy-MM-dd <-> LocalDate for form binding
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        binder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
            @Override public void setAsText(String text) {
                if (text == null || text.trim().isEmpty()) {
                    setValue(null);
                } else {
                    setValue(LocalDate.parse(text, fmt));
                }
            }
            @Override public String getAsText() {
                LocalDate value = (LocalDate) getValue();
                return value == null ? "" : fmt.format(value);
            }
        });
    }

}
