package com.bms.model;

import java.time.LocalDate;


public class Accounts {

	 private int accountId;
	    private String accountType;
	    private String accountHolderName;
	    private String accountHolderContact;
	    private double accountBalance;
	    private LocalDate accountSetupDate;
	    
		public Accounts() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Accounts(int accountId, String accountType, String accountHolderName, String accountHolderContact,
				double accountBalance, LocalDate accountSetupDate) {
			super();
			this.accountId = accountId;
			this.accountType = accountType;
			this.accountHolderName = accountHolderName;
			this.accountHolderContact = accountHolderContact;
			this.accountBalance = accountBalance;
			this.accountSetupDate = accountSetupDate;
		}
		/**
		 * @return the accountId
		 */
		public int getAccountId() {
			return accountId;
		}
		/**
		 * @param accountId the accountId to set
		 */
		public void setAccountId(int accountId) {
			this.accountId = accountId;
		}
		/**
		 * @return the accountType
		 */
		public String getAccountType() {
			return accountType;
		}
		/**
		 * @param accountType the accountType to set
		 */
		public void setAccountType(String accountType) {
			this.accountType = accountType;
		}
		/**
		 * @return the accountHolderName
		 */
		public String getAccountHolderName() {
			return accountHolderName;
		}
		/**
		 * @param accountHolderName the accountHolderName to set
		 */
		public void setAccountHolderName(String accountHolderName) {
			this.accountHolderName = accountHolderName;
		}
		/**
		 * @return the accountHolderContact
		 */
		public String getAccountHolderContact() {
			return accountHolderContact;
		}
		/**
		 * @param accountHolderContact the accountHolderContact to set
		 */
		public void setAccountHolderContact(String accountHolderContact) {
			this.accountHolderContact = accountHolderContact;
		}
		/**
		 * @return the accountBalance
		 */
		public double getAccountBalance() {
			return accountBalance;
		}
		/**
		 * @param accountBalance the accountBalance to set
		 */
		public void setAccountBalance(double accountBalance) {
			this.accountBalance = accountBalance;
		}
		/**
		 * @return the accountSetupDate
		 */
		public LocalDate getAccountSetupDate() {
			return accountSetupDate;
		}
		/**
		 * @param accountSetupDate the accountSetupDate to set
		 */
		public void setAccountSetupDate(LocalDate accountSetupDate) {
			this.accountSetupDate = accountSetupDate;
		}
		@Override
		public String toString() {
			return "Accounts [accountId=" + accountId + ", accountType=" + accountType + ", accountHolderName="
					+ accountHolderName + ", accountHolderContact=" + accountHolderContact + ", accountBalance="
					+ accountBalance + ", accountSetupDate=" + accountSetupDate + "]";
		}


}
