<base href="<?php echo HTTPS_SERVER; ?>">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <style> body{ background:#E8E8E8;} .buttons, #button-payment-method { width: 100%; padding-left:0%;padding-right:0%; text-align: center;}#button-confirm, #button-payment-method { font-size: 18px; padding: 7px; width:100%;}#confirm_block{padding:10px;}</style>
<style>
#confirm_block {
    box-shadow: 0 0 2px #ccc;
    width: 90%;
    margin: 70px auto;
    background: #fff;
}
p.confirm-title {
    font-size: 16px;
    text-align: center;
    color: #1d5f57;
    text-transform: capitalize;
	position:relative;
	padding-bottom: 20px;
    margin-bottom: 40px;
	padding-top: 80px;
}
div#confirm_block .radio {
    padding: 5px;
    font-size: 14px;
}
.buttons input {
    float: left;
	margin-right: 5px;
}
.agree_section{text-align:left;display: inline-block;    margin-top: 20px;    position: relative;}
#button-payment-method {
    margin-top: 20px;
	margin-bottom: 10px;
	    padding: 4px 12px;
}
.confirm-title:after {
    position: absolute;
    content: '';
    background-image: url(image/mab/border.png);
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    margin: 0 auto;
    height: 3px;
    background-repeat: no-repeat;
    background-position: center;
	background-size: contain;
}
#confirm_block label {
    font-weight: normal;
    color: #676767;
}
.pay-icon {
    width: 100px;
    height: 100px;
    background: #44c4a1;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    margin-top: -70px;
    margin: -70px auto;
    text-align: center;
    border: 5px solid #fff;
}
.pay-icon img {
    line-height: 8;
    display: inline-block;
    margin-top: 17px;
}

[type="radio"]:checked,
[type="radio"]:not(:checked) {
   position: absolute;
    width: 100%;
    display: inline;
    z-index: 99;
	-webkit-appearance:none;
	height: 100%;
    outline: 0;	
    opacity:0;
}
[type="radio"]:checked:focus,
[type="radio"]:not(:checked):focus{
	outline: 0;	
}
[type="radio"]:checked + label,
[type="radio"]:not(:checked) + label
{
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    line-height: 20px;
    display: inline-block;
    color: #666;
}
[type="radio"]:checked + label:before,
[type="radio"]:not(:checked) + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    border-radius: 100%;
    background: #fff;
}
[type="radio"]:checked + label:after,
[type="radio"]:not(:checked) + label:after {
    content: '';
    width: 10px;
    height: 10px;
    background: #337ab7;
    position: absolute;
    top: 4px;
    left: 4px;
    border-radius: 100%;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
[type="radio"]:not(:checked) + label:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
}
[type="radio"]:checked + label:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
}

/* Base for label styling */
[type="checkbox"]:not(:checked),
[type="checkbox"]:checked {
  position: absolute;
  opacity:0;
  z-index: 999;
  width: 100%;
}
.agree_section a {
    position: relative;
    z-index: 999999;
}
[type="checkbox"]:not(:checked) + label,
[type="checkbox"]:checked + label {
  position: relative;
  padding-left: 1.95em;
  cursor: pointer;
}

/* checkbox aspect */
[type="checkbox"]:not(:checked) + label:before,
[type="checkbox"]:checked + label:before {
  content: '';
  position: absolute;
  left: 0; top: 0;
  width: 1.25em; height: 1.25em;
  border: 1px solid #e0e0e0;
  background: #fff;
  border-radius: 4px;
  box-shadow: inset 0 1px 3px rgba(0,0,0,.1);
}
/* checked mark aspect */
[type="checkbox"]:not(:checked) + label:after,
[type="checkbox"]:checked + label:after {
  content: '\2713\0020';
  position: absolute;
  top: .15em; left: .22em;
  font-size: 1.3em;
  line-height: 0.8;
  color: #09ad7e;
  transition: all .2s;
  font-family: 'Lucida Sans Unicode', 'Arial Unicode MS', Arial;
}
/* checked mark aspect changes */
[type="checkbox"]:not(:checked) + label:after {
  opacity: 0;
  transform: scale(0);
}
[type="checkbox"]:checked + label:after {
  opacity: 1;
  transform: scale(1);
}


[type="checkbox"]:not(:checked):focus, [type="checkbox"]:checked:focus{outline:0;}

</style>
   
       
<div id="confirm_block">        
    <?php  if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<div class="pay-icon"><img src="image/mab/cash.png" class=""/></div>

<p class="confirm-title"><?php echo $text_payment_method; ?></p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <label><?php echo $payment_method['title']; ?></label>
    <?php if (isset($payment_method['terms'])&&$payment_method['terms']!='') { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  
</div>
<?php } ?>


<div class="buttons">
  <div class="agree_section">
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" /><label><?php if ($text_agree) {  echo $text_agree; } ?></label>
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" /><label><?php if ($text_agree) {  echo $text_agree; } ?></label>
    <?php } ?>
    &nbsp;<br>
    <?php } ?>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>

</div>
<script><!--
    $(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: '<?php echo $paymentSaveURL; ?>', 
	headers: { 'coookie': '<?php echo $s_id; ?>' },
        type: 'post',
        data: $('input[type=\'radio\']:checked, input[type=\'checkbox\']:checked, textarea'),
        dataType: 'json',
        beforeSend: function(request) {
         	$('#button-payment-method').button('loading');
		request.setRequestHeader("cookie", '<?php echo $s_id; ?>');
		},  
        complete: function() {
            $('#button-payment-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#confirm_block').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=webservices/api&method=confirm&version=1.6',
                    dataType: 'html',
                    success: function(html) {
                            $('#confirm_block').html(html);
                               
                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle">Confirm <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-checkout-confirm\']').trigger('click');
                        },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//--></script> 
<?php die; ?>
