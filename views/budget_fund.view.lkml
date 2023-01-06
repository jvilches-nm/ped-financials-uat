view: budget_fund {
  derived_table: {
    sql: SELECT budget_fund.pkbudgetfund,
                  budget_fund.fkbudget,
                  budget.fkbudgetyear,
                  budget.name budget_name,
                  budget_status.code status_code,
                  budget_status.name status_name
             FROM dbo.BudgetFund  AS budget_fund
             INNER JOIN dbo.Budget  AS budget ON budget_fund.fkBudget=budget.pkBudget
             INNER JOIN dbo.BudgetStatus  AS budget_status ON budget.fkBudgetStatus=budget_status.pkBudgetStatus
             INNER JOIN Common.BudgetYear  AS budget_year ON budget.fkBudgetYear=budget_year.pkBudgetYear
             WHERE YEAR(budget_year.StartDate)>=2020
               AND budget_status.code in ('FB', 'BS') ;;
    datagroup_trigger: ped_public_financials_test_datagroup
    indexes: ["pkbudgetfund", "fkbudget", "fkbudgetyear"]
  }

  label: "Budget"

  dimension: pk_budget_fund {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.pkbudgetfund ;;
  }
  dimension: fk_budget {
    type: number
    hidden: yes
    sql: ${TABLE}.fkbudget ;;
  }
  dimension: fk_budget_year {
    type: number
    hidden: yes
    sql: ${TABLE}.fkbudgetyear ;;
  }
  dimension: budget_name {
    type: string
    label: "Budget Name"
    sql: ${TABLE}.budget_name ;;
  }
  dimension: budget_status_code {
    type: string
    label: "Budget Status Code"
    sql: ${TABLE}.status_code ;;
  }
  dimension: budget_status {
    type: string
    label: "Budget Status"
    sql: ${TABLE}.status_name ;;
  }

}
