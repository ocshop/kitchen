<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="span12">
	<div class="warning"><?php echo $error_warning; ?></div>
  </div>
<?php } ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  
  <div class="box-container">
  <div class="content-border">
	<h1><?php echo $heading_title; ?></h1>
	<p><?php echo $text_description; ?></p>
	<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="voucher">
		<div class="control-group">
			<label class="control-label" for="to_name"><span class="required">*</span> <?php echo $entry_to_name; ?></label>
			<div class="controls">
				<input class="q2" type="text" name="to_name" value="<?php echo $to_name; ?>" />
				<?php if ($error_to_name) { ?>
				<span class="error help-inline"><?php echo $error_to_name; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="to_email"><span class="required">*</span> <?php echo $entry_to_email; ?></label>
			<div class="controls">
				<input class="q2" type="text" name="to_email" value="<?php echo $to_email; ?>" />
				<?php if ($error_to_email) { ?>
				<span class="error help-inline"><?php echo $error_to_email; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="from_name"><span class="required">*</span> <?php echo $entry_from_name; ?></label>
			<div class="controls">
				<input class="q2" type="text" name="from_name" value="<?php echo $from_name; ?>" />
				<?php if ($error_from_name) { ?>
				<span class="error help-inline"><?php echo $error_from_name; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="from_name"><span class="required">*</span> <?php echo $entry_from_email; ?></label>
			<div class="controls">
				<input class="q2" type="text" name="from_email" value="<?php echo $from_email; ?>" />
				<?php if ($error_from_email) { ?>
				<span class="error help-inline"><?php echo $error_from_email; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="voucher_theme_id"><span class="required">*</span> <?php echo $entry_theme; ?></label>
			<div class="controls">
				<?php foreach ($voucher_themes as $voucher_theme) { ?>
				<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
				<label class="radio" for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?>
					<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
				</label>
				<?php } else { ?>
				<label class="radio" for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?>
					<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
				</label>
				<?php } ?>
				<?php } ?>
				<?php if ($error_theme) { ?>
				<span class="error help-inline"><?php echo $error_theme; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="message"><?php echo $entry_message; ?></label>
			<div class="controls">
				<textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="amount"><span class="required">*</span> <?php echo $entry_amount; ?></label>
			<div class="controls">
				<input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />
				<?php if ($error_amount) { ?>
				<span class="error help-inline"><?php echo $error_amount; ?></span>
				<?php } ?>
			</div>
		</div>
	<div class="buttons">
	  <div>
		<label class="fleft checkbox inline">
		<?php if ($agree) { ?>
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" name="agree" value="1" />
		<?php } ?>
		<?php echo $text_agree; ?>
		</label>
		<a onclick="$('#voucher').submit();" class="button-cont-right right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
	  </div>
	
  </form>
  </div>
  </div>
	<?php echo $content_bottom; ?></div>
		<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
  
<?php echo $footer; ?>