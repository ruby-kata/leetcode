# @param {Integer} purchase_amount
# @return {Integer}
def account_balance_after_purchase(purchase_amount)
    offset = (purchase_amount % 10) < 5 ? 0 : 1
    100 - (purchase_amount/10 + offset) * 10
end
