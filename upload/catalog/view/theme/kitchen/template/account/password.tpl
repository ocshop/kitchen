<?php echo $header; ?>
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
	<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="password">
	<h2><?php echo $text_password; ?></h2>
	<div class="content">
	  <table class="form">
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="password"><span class="required">*</span> <?php echo $entry_password; ?></label>
					<div class="controls">
						<input type="password" name="password" value="<?php echo $password; ?>" />
						<?php if ($error_password) { ?>
						<span class="error help-inline"><?php echo $error_password; ?></span>
						<?php } ?>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="confirm"><span class="required">*</span> <?php echo $entry_confirm; ?></label>
					<div class="controls">
						<input type="password" name="confirm" value="<?php echo $confirm; ?>" />
						<?php if ($error_confirm) { ?>
						<span class="error help-inline"><?php echo $error_confirm; ?></span>
						<?php } ?>
					</div>
				</div>
			</td>
		</tr>
	  </table>
	</div>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right"><a onclick="$('#password').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
	</div>
  </form>
  </div>
  <?php echo $content_bottom; ?></div>
						<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>