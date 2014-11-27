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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial">
	<div class="content contact-f form-horizontal">
		<div class="control-group">
			<label class="control-label" for="title"><?php echo $entry_title ?></label>
				<div class="controls">
					<input class="span5" type="text" name="title" value="<?php echo $title; ?>" />
					<?php if ($error_title) { ?>
					<span class="error help-inline"><?php echo $error_title; ?></span>
					<?php } ?>
				</div>
        </div>
		<div class="control-group">
			<label class="control-label" for="name"><?php echo $entry_name ?></label>
				<div class="controls">
					<input class="span5" type="text" name="name" value="<?php echo $name; ?>" />
					<?php if ($error_name) { ?>
					<span class="error help-inline"><?php echo $error_name; ?></span>
					<?php } ?>
				</div>
        </div>
		<div class="control-group">
			<label class="control-label" for="city"><?php echo $entry_city ?></label>
				<div class="controls">
					<input class="span5" type="text" name="city" value="<?php echo $city; ?>" />
				</div>
        </div>
		<div class="control-group">
			<label class="control-label" for="email"><?php echo $entry_email ?></label>
				<div class="controls">
					<input class="span5" type="text" name="email" value="<?php echo $email; ?>" />
					<?php if ($error_email) { ?>
					<span class="error help-inline"><?php echo $error_email; ?></span>
					<?php } ?>
				</div>
        </div>
		<div class="control-group">
			<label class="control-label" for="enquiry"><?php echo $entry_enquiry; ?></label>
			<div class="controls">
				<textarea class="span5" name="description" cols="40" rows="10" ><?php echo $description; ?></textarea>
				<?php if ($error_enquiry) { ?>
				<span class="error help-inline"><?php echo $error_enquiry; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="rating"><?php echo $entry_rating; ?></label>
				<div class="controls form-inline border">
				<span class="radio"><?php echo $entry_bad; ?></span>&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp; <span class="radio"><?php echo $entry_good; ?></span><br />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="captcha"><?php echo $entry_captcha; ?></label>
			<div class="controls">
				<input type="text" class="capcha" name="captcha" value="<?php echo $captcha; ?>" />
				<div class="captcha"><img src="index.php?route=information/contact/captcha" alt="" /></div>
				<?php if ($error_captcha) { ?>
				<span class="error help-inline"><?php echo $error_captcha; ?></span>
				<?php } ?>
				<div class="buttons"><a  onclick="$('#testimonial').submit();" class="button"><span><?php echo $button_send; ?></span></a></div>
				<div class="buttons"><a class="button" href="<?php echo $showall_url;?>"><span><?php echo $show_all; ?></span></a></div>
			</div>
		</div>
      </div>
    </form>
<?php echo $content_bottom; ?></div>
	<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>