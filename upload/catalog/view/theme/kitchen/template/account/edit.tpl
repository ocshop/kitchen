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
  <h1><?php echo $heading_title; ?></h1>
  <div class="box-container">
	<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit">
	<h2><?php echo $text_your_details; ?></h2>
	<div class="content">
	  <table class="form">
		<tr>
		  <td>
			<div class="control-group">
				<label class="control-label" for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
				<div class="controls">
					<?php if ($error_firstname) { ?>
					<?php } ?><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
					<span class="error help-inline"><?php echo $error_firstname; ?></span>
				</div>
			</div>
		</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="lastname"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
					<div class="controls">
						<input type="text" name="lastname" value="<?php echo $lastname; ?>" />
						<?php if ($error_lastname) { ?>
						<span class="error help-inline"><?php echo $error_lastname; ?></span>
						<?php } ?>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="email"><span class="required">*</span> <?php echo $entry_email; ?></label>
					<div class="controls">
						<input type="text" name="email" value="<?php echo $email; ?>" />
						<?php if ($error_email) { ?>
						<span class="error help-inline"><?php echo $error_email; ?></span>
						<?php } ?>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="telephone"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
					<div class="controls">
						<input type="text" name="telephone" value="<?php echo $telephone; ?>" />
						<?php if ($error_telephone) { ?>
						<span class="error help-inline"><?php echo $error_telephone; ?></span>
						<?php } ?>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="fax"><?php echo $entry_fax; ?></label>
					<div class="controls">
						<input type="text" name="fax" value="<?php echo $fax; ?>" />
					</div>
				</div>
			</td>
		</tr>
	  </table>
	</div>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right">
		<a onclick="$('#edit').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a>
	  </div>
	</div>
  </form>
  </div>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
			
<?php echo $footer; ?>