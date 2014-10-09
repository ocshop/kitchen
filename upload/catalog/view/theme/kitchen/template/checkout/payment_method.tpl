<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<div>
	<?php foreach ($payment_methods as $payment_method) { ?>
	<div class="highlight">
		<label class="radio" for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?>
			<?php if ($payment_method['code'] == $code || !$code) { ?>
			<?php $code = $payment_method['code']; ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
			<?php } else { ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
			<?php } ?>
		</label>
	</div>
	<?php } ?>
</div>
<br />
<?php } ?>
<label><?php echo $text_comments; ?></label>
<textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
<?php if ($text_agree) { ?>
<div class="buttons">
	<label class="checkbox">
		<?php if ($agree) { ?>
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" name="agree" value="1" />
		<?php } ?>
		<?php echo $text_agree; ?>
	</label>
	<a id="button-payment-method" class="button-cont-right fright" ><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right">
	<a id="button-payment-method" class="button"><span><?php echo $button_continue; ?></span></a>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('.colorbox').fancybox({
	
	
});
//--></script> 