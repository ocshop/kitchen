<?php echo $header; ?>
<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1 class="style-1"><?php echo $heading_title; ?></h1>
  <div class="box-container">
	<?php echo $text_description; ?>
	<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return">
	
	<div class="content content-border">
		<h2><?php echo $text_order; ?></h2>
		<div class="control-group">
			<label class="control-label" for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
			<div class="controls">
				<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="span4" />
				<?php if ($error_firstname) { ?>
				<span class="error help-inline"><?php echo $error_firstname; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="lastname"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
			<div class="controls">
				<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="span4" />
				<?php if ($error_lastname) { ?>
				<span class="error help-inline"><?php echo $error_lastname; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email"><span class="required">*</span> <?php echo $entry_email; ?></label>
			<div class="controls">
				<input type="text" name="email" value="<?php echo $email; ?>" class="span4" />
				<?php if ($error_email) { ?>
				<span class="error help-inline"><?php echo $error_email; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="telephone"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
			<div class="controls">
				<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="span4" />
				<?php if ($error_telephone) { ?>
				<span class="error help-inline"><?php echo $error_telephone; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="order_id"><span class="required">*</span> <?php echo $entry_order_id; ?></label>
			<div class="controls">
				<input type="text" name="order_id" value="<?php echo $order_id; ?>" class="span4" />
				<?php if ($error_order_id) { ?>
				<span class="error help-inline"><?php echo $error_order_id; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="date_ordered"><?php echo $entry_date_ordered; ?></label>
			<div class="controls">
				<input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="span4 date" />
			</div>
		</div>
	</div>
	
	<div id="return-product">
	  <div class="content  content-border">
		<h2><?php echo $text_product; ?></h2>
		<div class="return-product">
		  <div class="return-name control-group">
			<label class="control-label" for="product"><span class="required">*</span> <b><?php echo $entry_product; ?></b></label>
			<div class="controls">
				<input type="text" name="product" value="<?php echo $product; ?>" class="span4" />
				<?php if ($error_product) { ?>
				<span class="error help-inline"><?php echo $error_product; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-model control-group">
			<label class="control-label" for="model"><span class="required">*</span> <b><?php echo $entry_model; ?></b></label>
			<div class="controls">
				<input type="text" name="model" value="<?php echo $model; ?>" class="span4" />
				<?php if ($error_model) { ?>
				<span class="error help-inline"><?php echo $error_model; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-quantity control-group">
			<label class="control-label" for="model"><b><?php echo $entry_quantity; ?></b></label>
			<div class="controls">
				<input type="text" name="quantity" value="<?php echo $quantity; ?>" class="span4" />
			</div>
		  </div>
		</div>
		<div class="return-detail ">
		  <div class="return-reason control-group">
			<label class="control-label"></label>
			<div class="controls">
				<label><span class="required">*</span> <b><?php echo $entry_reason; ?></b></label>
				<?php foreach ($return_reasons as $return_reason) { ?>	
				<?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
				<label class="radio" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /><?php echo $return_reason['name']; ?></label>
				<?php } else { ?>
				<label class="radio" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /><?php echo $return_reason['name']; ?></label>
				<?php  } ?>
				<?php  } ?>
				<?php if ($error_reason) { ?>
				<span class="error help-inline"><?php echo $error_reason; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-opened control-group">
			<label class="control-label"></label>
			<div class="controls">
				<label><b><?php echo $entry_opened; ?></b></label>
				<label class="radio" for="opened">
					<?php if ($opened) { ?>
					<input type="radio" name="opened" value="1" id="opened" checked="checked" />
					<?php } else { ?>
					<input type="radio" name="opened" value="1" id="opened" />
					<?php } ?>
					<?php echo $text_yes; ?>
				</label>
				<label class="radio" for="unopened">
					<?php if (!$opened) { ?>
					<input type="radio" name="opened" value="0" id="unopened" checked="checked" />
					<?php } else { ?>
					<input type="radio" name="opened" value="0" id="unopened" />
					<?php } ?>
					<?php echo $text_no; ?>
				</label>
			</div>
		  </div>
		  <div class="return-captcha control-group">
			<label class="control-label"></label>
			<div class="controls">
				<label><b><?php echo $entry_captcha; ?></b></label>
				<input class="span2" type="text" name="captcha" value="<?php echo $captcha; ?>" />
				<img src="index.php?route=account/return/captcha" alt="" />
				<?php if ($error_captcha) { ?>
				<span class="error help-inline"><?php echo $error_captcha; ?></span>
				<?php } ?>
			</div>
		  </div>
		  
		</div>
			<div class="control-group">
				<label class="control-label"><?php echo $entry_fault_detail; ?></label>
				<div class="controls">
					<textarea class="span4" name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
				</div>
			</div>
			<?php if ($text_agree) { ?>
			<div class="buttons">
			<div class="left"><a href="<?php echo $back; ?>" class="button-return-left"><span><?php echo $button_back; ?></span></a></div>
			<div class="right"><?php echo $text_agree; ?>
				<?php if ($agree) { ?>
				<input type="checkbox" name="agree" value="1" checked="checked" />
				<?php } else { ?>
				<input type="checkbox" name="agree" value="1" />
				<?php } ?>
				<input type="submit" value="<?php echo $button_continue; ?>" class="button-return-right" />
			</div>
			</div>
			<?php } else { ?>
			<div class="buttons">
			<div class="left"><a href="<?php echo $back; ?>" class="button-return-left"><i class="icon-circle-arrow-left"></i><?php echo $button_back; ?></a></div>
			<div class="right button-return-right-i">
				<input type="submit" value="<?php echo $button_continue; ?>" class="button-return-right" />
				<i class="icon-circle-arrow-right"></i>
			</div>
			</div>
			<?php } ?>
	  </div>
	</div>
	
  </form>
  </div>
  <?php echo $content_bottom; ?></div>
	<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
	
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').fancybox({
		
	});
});
//--></script>
<?php echo $footer; ?>