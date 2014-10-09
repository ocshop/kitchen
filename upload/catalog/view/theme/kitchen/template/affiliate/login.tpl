<?php echo $header; ?>
<?php if ($success) { ?>
  <div class="span12"><div class="success"><?php echo $success; ?></div></div>
<?php } ?>
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
	<?php echo $text_description; ?>
	  <div class="login-content row-fluid">
		<div class="span6">
			<div class="left">
				<div class="heading">
					<i class="icon-file-alt"></i>
					<div class="extra-wrap">
						<h2><?php echo $text_new_affiliate; ?></h2>
						
					</div>
				</div>
				<div class="content">
					<?php echo $text_register_account; ?> 
					<a href="<?php echo $register; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a>
				</div>
			</div>
		</div>
		<div class="span6">
		<div class="right">
			<div class="heading">
				<i class="icon-key"></i>
				<div class="extra-wrap">
					<h2><?php echo $text_returning_affiliate; ?></h2>
					<b><?php echo $text_i_am_returning_affiliate; ?></b>
				</div>
			</div>
		  <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login">
			<div class="content">
				<div class="control-group">
					<label class="padd-form control-label" for="email"><?php echo $entry_email; ?></label>
					<div class="controls">
						<input type="text" name="email" value="<?php echo $email; ?>" />
					</div>
				</div>
				<div class="control-group">
					<label class="padd-form control-label" for="password"><?php echo $entry_password; ?></label>
					<div class="controls">
						<input type="password" name="password" value="<?php echo $password; ?>" />
					</div>
				</div>
				<div class="login-buttons">
					<a onclick="$('#login').submit();" class="button-cont-right"><?php echo $button_login; ?><i class="icon-circle-arrow-right"></i></a>
					<?php if ($redirect) { ?>
					<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					<?php } ?>
					<a class="link-login" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				</div>
			</div>
		  </form>
		</div>
		</div>
	  </div>
  </div>
  <?php echo $content_bottom; ?></div>
			  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>