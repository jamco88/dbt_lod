{% macro cents_to_dollars(column_name) %}

round( 1.0 * {{ column_name }} / 100)

{% endmacro %}