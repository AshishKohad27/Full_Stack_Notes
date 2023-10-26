custom data storeage in wordpress

<!-- Html -->
  <!-- Input Box -->

```htm
<form class="form-input-box" id="viari-formSubmit">
  <div class="form-input-boxes">
    <input
      type="text"
      name="companyname"
      id="viari-form-companyname"
      placeholder="Company Name"
      required
    />
    <p class="viari-form-error error-companyname">
      Please Filled above Filled.
    </p>
  </div>
  <div class="form-input-boxes">
    <input
      type="email"
      name="email"
      id="viari-form-email"
      placeholder="Email Address"
      required
    />
    <p class="viari-form-error error-email">Please Filled above Filled.</p>
  </div>
  <div class="form-input-boxes">
    <input
      type="tel"
      name="mobile"
      id="viari-form-mobile"
      placeholder="Contact No"
      required
      maxlength="10"
    />
    <p class="viari-form-error error-mobile">Please Filled above Filled.</p>
  </div>
  <div class="form-input-boxes">
    <textarea
      type="text"
      name="message"
      id="viari-form-msg"
      placeholder="Write a messege"
      rows="8"
      required
    ></textarea>
    <p class="viari-form-error error-msg">Please Filled above Filled.</p>
  </div>
  <input type="submit" class="contact-submitbtn" value="MAKE AN ENQUIRY" />
</form>
```

<!-- JS Code -->

```javascript

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>

<script>
    // Validation of Form
    validationOfInputFiled();

    // Verify the user and then allowed for Download;
    $(document).ready(function () {
        $('#viari-formSubmit').submit(function (e) {
            e.preventDefault();
            const link = "<?php echo admin_url('admin-ajax.php'); ?>";
            const companyName = $('#viari-form-companyname')[0].value;
            const mobile = $('#viari-form-mobile')[0].value;
            const email = $('#viari-form-email')[0].value;
            const msg = $('#viari-form-msg')[0].value;
            const payload = {
                companyName,
                mobile,
                email,
                msg
            };
            console.log("payload:", payload);
            if (companyName && mobile && email && msg) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: link,
                    data: {
                        action: 'contact_us',
                        payload
                    },
                    success: function (result) {
                        console.log("success:", result.data);
                        TriggerThankYouModal();
                        resetForm();
                    },
                    error: function (xhr, status, error) {
                        console.log("error:", error);
                        // console.log("error:", xhr);
                        alert("Error occurred while processing the request.");
                    }
                });
            } else {
                // alert("Select Atleast One Layer For download");
            }
        })
    });

    function resetForm() {
        $('#viari-form-companyname')[0].value = '';
        $('#viari-form-mobile')[0].value = '';
        $('#viari-form-email')[0].value = '';
        $('#viari-form-msg')[0].value = '';
    }

    function validationOfInputFiled() {
        $('#viari-form-mobile').on('input', function (e) {
            const inputText = event.target.value;
            const numericText = inputText.replace(/[^0-9]/g, '');
            event.target.value = numericText;
        });
    }

    // ThankYou Modal Function (Open and Close)
    function TriggerThankYouModal() {
        $('.open-modal-btn').click();
        // Close Modal
        setTimeout(() => {
            $('.close-modal-btn').click();
        }, 1500);
    }


    // Sending Email to Viari Network

    function EmailSendToViariOperator(payload) {
        const form_data = {
            recipientEmail: "kohadashish27@gmail.com",
            ...payload
        };
        console.log("form_data:", form_data);
        $.ajax({
            type: "POST",
            url: "<?php echo admin_url('admin-ajax.php'); ?>",
            data: {
                action: "send_email_action", // Custom action name to handle this request
                payload
            },
            success: function (response) {
                // $("#response").html(response);
                alert("Email Send to Viari Operator");
            }
        });
    }

</script>
```

<!-- Function.php file -->
```php
// contact_us page data store in database
add_action('wp_ajax_contact_us', 'ajax_contact_us');
add_action('wp_ajax_nopriv_contact_us', 'ajax_contact_us');
function ajax_contact_us()
{
	// An associative array to store form data
	$arr = $_POST['payload'];
	global $wpdb;
	global $table_prefix;

	// Constructing the full table name with the WordPress table prefix
	$table = $table_prefix . 'contact_us';

	// Get the email from the form data
	$email = $arr['email'];

	if ($email) {
		$result = $wpdb->insert($table, [
			"companyName" => $arr['companyName'],
			"email" => $arr['email'],
			"mobile" => $arr['mobile'],
			"message" => $arr['msg'],
		]);

		// Checking if the insertion was successful
		if ($result !== false) {
			// Sending a JSON success response with a message
			wp_send_json_success("Data inserted successfully.");
		} else {
			// Sending a JSON error response with a message
			wp_send_json_error("Failed to insert data.");
		}

	}

}
```
