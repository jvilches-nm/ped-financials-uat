view: rec_names {
  derived_table: {
    sql: select distinct fiscal_year, rec_name, rec_code from looker.rec_member_districts ;;
  }
  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: rec_code {
    type: string
    sql: ${TABLE}.rec_code ;;
  }

  dimension: rec_name {
    type: string
    sql: ${TABLE}.rec_name ;;
    order_by_field: rec_name_order
  }

  dimension: rec_name_order {
    type: number
    hidden: yes
    sql: cast(substring(rec_name, 2, 2) as numeric) ;;
  }

  measure: count {
    type: count
    drill_fields: [rec_name]
  }
}
  # values appear in the order you write in the case statement, rec_name_order is to show the values in the order.
