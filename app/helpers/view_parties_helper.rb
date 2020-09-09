module ViewPartiesHelper
    def datepicker_input form, field
        content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
          form.datetime_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
        end
      end
end
