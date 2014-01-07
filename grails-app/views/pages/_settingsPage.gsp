<div class="tabbable">
    <ul class="nav nav-pills well-small" style="background-color: #f5f5f5;margin-bottom: 0">
        <li class="active"><a href="#profileSettings" data-toggle="tab">Profile Settings</a></li>
        <li><a href="#notificationSettings" data-toggle="tab">Notification Settings</a></li>
    </ul>
    <div class="tab-content well-small">
        <div class="tab-pane active" id="profileSettings">
            <div class="well-small">
                <div style="background-color: #ffffff;border: 0;">
                    <div class="form">
                        <div class="well-small">
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label" style="width: 300px;padding-right: 10px;" for="firstNameField">First Name</label>
                                        <div id="firstNameField" class="controls">
                                            <input type="text" data-bind="value:firstName">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" style="width: 300px;padding-right: 10px;" for="lastNameField">Last Name</label>
                                        <div id="lastNameField" class="controls">
                                            <input type="text" data-bind="value:lastName">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" style="width: 300px;padding-right: 10px;" for="genderField">Gender</label>
                                        <div id="genderField" class="controls">
                                            <select data-bind="options:genderOptions,value:gender"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="summaryField">
                                    Brief Summary about yourself
                                </label>
                                <div id="summaryField" class="controls">
                                    <textarea rows="3" class="span12" data-bind="value:generalDetails,valueUpdate:'afterkeydown'"></textarea>
                                </div>
                            </div>


                            <div class="control-group">
                                <label class="control-label" style="width: 300px;padding-right: 10px;" for="notificationSelector2"> </label>
                                <div class="controls">
                                    <input class="btn btn-danger btn-small updateProfileSettingsButton"
                                           data-bind="visible:isProfileDirty"
                                           data-loading-text="Updating.."
                                           type="button"
                                           value="Update"/>
                                    <label class="alert" data-bind="visible:isProfileDirty()==false">
                                        Change a field to update profile.
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="notificationSettings">

            <div class="well-small">
                <div style="background-color: #ffffff;border: 0;">
                    <div class="form">
                        <div class="well-small">
                            <div class="control-group">
                                <label class="control-label" style="width: 300px;padding-right: 10px;" for="notificationSelector1">Notifications on new features</label>
                                <div class="controls">
                                    <select id="notificationSelector1" name="featureNotification" data-bind="value:selectedFeatureNotificationSetting">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="width: 300px;padding-right: 10px;" for="notificationSelector2"> </label>
                                <div class="controls">
                                    <input class="btn btn-danger btn-small updateNotificationSettingsButton"
                                           data-bind="visible:isNotificationDirty"
                                           data-loading-text="Updating.."
                                           type="button"
                                           value="Update"/>
                                    <label class="alert" data-bind="visible:isNotificationDirty()==false">
                                        Change a field to update settings.
                                    </label>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>