class Bank:
    def __init__(self):
        self.users = {}
        self.accounts = {}
        self.account_number_counter = 1

    def create_user(self, id_number, username):
        if id_number in self.users:
            print("User ID already exists.")
        else:
            self.users[id_number] = username
            print(f"User {username} created with ID: {id_number}")

    def filter_users(self, keyword):
        filtered_users = []
        for id_number, username in self.users.items():
            if keyword.lower() in username.lower():
                filtered_users.append((id_number, username))
        return filtered_users

    def register_account(self, agency_number, user_id):
        if user_id not in self.users:
            print("User ID not found.")
        else:
            account_number = self.account_number_counter
            self.account_number_counter += 1
            user = self.users[user_id]
            self.accounts[account_number] = {"agency_number": agency_number, "balance": 0, "user": user, "transactions": []}
            print(f"Bank Account registered successfully: {agency_number}-{account_number}")

    def deposit(self, account_number, amount):
        if account_number in self.accounts:
            if amount > 0:
                self.accounts[account_number]["balance"] += amount
                self.accounts[account_number]["transactions"].append(f"Deposit: +R${amount:.2f}")
                print(f"Deposited R${amount:.2f} into Account {account_number}")
            else:
                print("Invalid amount. Please enter a positive value.")
        else:
            print("Account not found.")

    def withdraw(self, account_number, amount):
        if account_number in self.accounts:
            if amount > 0 and amount <= 500 and len(self.accounts[account_number]["transactions"]) < 3:
                if self.accounts[account_number]["balance"] >= amount:
                    self.accounts[account_number]["balance"] -= amount
                    self.accounts[account_number]["transactions"].append(f"Withdrawal: -R${amount:.2f}")
                    print(f"Withdrew R${amount:.2f} from Account {account_number}")
                else:
                    print("Insufficient funds.")
            elif amount <= 0:
                print("Invalid amount. Please enter a positive value.")
            elif amount > 500:
                print("Withdrawal limit exceeded. Maximum amount is R$500.00")
            else:
                print("Withdrawal limit exceeded. Maximum number of transactions is 3.")
        else:
            print("Account not found.")

    def visualize_extract(self, account_number):
        if account_number in self.accounts:
            print(f"Account Number: {account_number}")
            print("----- Transactions -----")
            transactions = self.accounts[account_number]["transactions"]
            if transactions:
                for transaction in transactions:
                    print(transaction)
            else:
                print("No transactions found.")
            print(f"Balance: R${self.accounts[account_number]['balance']:.2f}")
        else:
            print("Account not found.")

    def display_menu(self):
        print("===== Banking System Menu =====")
        print("1. Create User")
        print("2. Filter Users")
        print("3. Register Bank Account")
        print("4. Deposit")
        print("5. Withdraw")
        print("6. Visualize Extract")
        print("0. Exit")

    def main(self):
        while True:
            self.display_menu()
            choice = input("Enter your choice: ")

            if choice == "1":
                id_number = input("Enter the ID number: ")
                username = input("Enter the username: ")
                self.create_user(id_number, username)
            elif choice == "2":
                keyword = input("Enter the keyword to filter users: ")
                filtered_users = self.filter_users(keyword)
                if filtered_users:
                    print("Filtered Users:")
                    for user in filtered_users:
                        print(f"ID: {user[0]}, Username: {user[1]}")
                else:
                    print("No users found.")
            elif choice == "3":
                agency_number = input("Enter the agency number: ")
                user_id = input("Enter the user ID: ")
                self.register_account(agency_number, user_id)
            elif choice == "4":
                account_number = int(input("Enter the account number: "))
                amount = float(input("Enter the amount to deposit: "))
                self.deposit(account_number, amount)
            elif choice == "5":
                account_number = int(input("Enter the account number: "))
                amount = float(input("Enter the amount to withdraw: "))
                self.withdraw(account_number, amount)
            elif choice == "6":
                account_number = int(input("Enter the account number: "))
                self.visualize_extract(account_number)
            elif choice == "0":
                print("Exiting the banking system...")
                break
            else:
                print("Invalid choice. Please try again.")


# Example usage
bank = Bank()
bank.main()
