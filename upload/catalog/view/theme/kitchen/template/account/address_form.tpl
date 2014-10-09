<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div  class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="box-container">
	  <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address">
		<h2><?php echo $text_edit_address; ?></h2>
			<div class="content">
			  <table class="form">
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
							<div class="controls">
								<input type="text" name="firstname" value="<?php echo $firstname; ?>" />
								<?php if ($error_firstname) { ?>
								<span class="error help-inline"><?php echo $error_firstname; ?></span>
								<?php } ?>
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
							<label class="control-label" for="company"><?php echo $entry_company; ?></label>
							<div class="controls">
								<input type="text" name="company" value="<?php echo $company; ?>" />
							</div>
						</div>
					</td>
				</tr>
				<?php if ($company_id_display) { ?>
					<tr>
						<td>
							<div class="control-group">
								<label class="control-label" for="company_id"><?php echo $entry_company_id; ?></label>
								<div class="controls">
									<input type="text" name="company_id" value="<?php echo $company_id; ?>" />
									<?php if ($error_company_id) { ?>
									<span class="error help-inline"><?php echo $error_company_id; ?></span>
									<?php } ?>
								</div>
							</div>
						</td>
					</tr>
				<?php } ?>
				<?php if ($tax_id_display) { ?>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="tax_id"><?php echo $entry_tax_id; ?></label>
							<div class="controls">
								<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
								<?php if ($error_tax_id) { ?>
								<span class="error help-inline"><?php echo $error_tax_id; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<?php } ?>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="address_1"><span class="required">*</span> <?php echo $entry_address_1; ?></label>
							<div class="controls">
								<input type="text" name="address_1" value="<?php echo $address_1; ?>" />
								<?php if ($error_address_1) { ?>
								<span class="error help-inline"><?php echo $error_address_1; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="address_2"><?php echo $entry_address_2; ?></label>
							<div class="controls">
								<input type="text" name="address_2" value="<?php echo $address_2; ?>" />
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="city"><span class="required">*</span> <?php echo $entry_city; ?></label>
							<div class="controls">
								<input type="text" name="city" value="<?php echo $city; ?>" />
								<?php if ($error_city) { ?>
								<span class="error help-inline"><?php echo $error_city; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="postcode"><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></label>
							<div class="controls">
								<input type="text" name="postcode" value="<?php echo $postcode; ?>" />
								<?php if ($error_postcode) { ?>
								<span class="error help-inline"><?php echo $error_postcode; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="country_id"><span class="required">*</span> <?php echo $entry_country; ?></label>
							<div class="controls">
								<select name="country_id">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
								<?php if ($error_country) { ?>
								<span class="error help-inline"><?php echo $error_country; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="zone_id"><span class="required">*</span> <?php echo $entry_zone; ?></label>
							<div class="controls">
								<select name="zone_id">
								</select>
								<?php if ($error_zone) { ?>
								<span class="error help-inline"><?php echo $error_zone; ?></span>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="default"><?php echo $entry_default; ?></label>
							<div class="controls">
								<?php if ($default) { ?>
								<label class="radio inline">
									<input type="radio" name="default" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								</label>
								<label class="radio inline">
									<input type="radio" name="default" value="0" />
									<?php echo $text_no; ?>
								</label>
								<?php } else { ?>
								<label class="radio inline">
									<input type="radio" name="default" value="1" />
								<?php echo $text_yes; ?>
								</label>
								<label class="radio inline">
									<input type="radio" name="default" value="0" checked="checked" />
								<?php echo $text_no; ?>
								</label>
								<?php } ?>
							</div>
						</div>
					</td>
				</tr>
			  </table>
			</div>
			<div class="buttons">
			  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
			  <div class="right"><a onclick="$('#address').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
			</div>
	  </form>
  </div>
  <?php echo $content_bottom; ?></div>
		<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

					<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/kitchen/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}
	
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
<?php echo $footer; ?>