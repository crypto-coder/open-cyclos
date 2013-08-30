<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://devel.cyclos.org/tlibs/cyclos-core" prefix="cyclos" %>

<cyclos:menu url="/do/admin/home" key="menu.admin.home" />
<cyclos:menu key="menu.admin.personal">
	<cyclos:menu url="/do/admin/adminProfile" key="menu.admin.personal.profile" />
	<cyclos:menu url="/do/admin/changePassword" key="menu.admin.personal.changePassword" />
	<cyclos:menu url="/do/admin/mailPreferences" key="menu.admin.personal.mailPreferences" />
</cyclos:menu>

<cyclos:menu key="menu.admin.alerts">
	<cyclos:menu url="/do/admin/systemAlerts" key="menu.admin.alerts.system" permission="${AdminSystemPermission.ALERTS_VIEW_SYSTEM_ALERTS}" />
	<cyclos:menu url="/do/admin/memberAlerts" key="menu.admin.alerts.member" permission="${AdminSystemPermission.ALERTS_VIEW_MEMBER_ALERTS}" />
	<c:if test="${cyclos:granted(AdminSystemPermission.ALERTS_VIEW_SYSTEM_ALERTS) || cyclos:granted(AdminSystemPermission.ALERTS_VIEW_MEMBER_ALERTS)}">
		<cyclos:menu url="/do/admin/searchAlerts" key="menu.admin.alerts.alertHistory" />
	</c:if>
	<cyclos:menu url="/do/admin/viewErrorLog" key="menu.admin.alerts.errorLog" permission="${AdminSystemPermission.ERROR_LOG_VIEW}" />
	<cyclos:menu url="/do/admin/searchErrorLog" key="menu.admin.alerts.errorLogHistory" permission="${AdminSystemPermission.ERROR_LOG_VIEW}" />
</cyclos:menu>

<cyclos:menu key="menu.admin.accounts">
	<cyclos:menu url="/do/admin/listCurrencies" key="menu.admin.accounts.currencies" permission="${AdminSystemPermission.CURRENCIES_VIEW}" />
	<cyclos:menu url="/do/admin/listAccountTypes" key="menu.admin.accounts.manage" permission="${AdminSystemPermission.ACCOUNTS_VIEW}" />
	<cyclos:menu url="/do/admin/accountOverview" key="menu.admin.accounts.details" permission="${AdminSystemPermission.ACCOUNTS_INFORMATION}" />
	<cyclos:menu url="/do/admin/searchScheduledPayments" key="menu.admin.accounts.scheduledPayments" permission="${AdminSystemPermission.ACCOUNTS_SCHEDULED_INFORMATION}" />
	<cyclos:menu url="/do/admin/selfPayment" key="menu.admin.accounts.systemPayment" permission="${AdminSystemPermission.PAYMENTS_PAYMENT}" />
	<cyclos:menu url="/do/admin/payment?selectMember=true" key="menu.admin.accounts.memberPayment" permission="${AdminMemberPermission.PAYMENTS_PAYMENT}"/>
	<cyclos:menu url="/do/admin/otPoC" key="menu.admin.accounts.otPoC" label="Open Transactions - PoC" permission="${AdminSystemPermission.CURRENCIES_VIEW}" />
</cyclos:menu>
<cyclos:menu key="menu.admin.usersGroups">
	<cyclos:menu url="/do/admin/searchMembers" key="menu.admin.usersGroups.members" permission="${AdminMemberPermission.MEMBERS_VIEW}" />
	<c:if test="${cyclos:granted(AdminMemberPermission.BULK_ACTIONS_CHANGE_GROUP) || cyclos:granted(AdminMemberPermission.BULK_ACTIONS_CHANGE_BROKER) || cyclos:granted(AdminMemberPermission.BULK_ACTIONS_GENERATE_CARD) || cyclos:granted(AdminMemberPermission.BULK_ACTIONS_CHANGE_CHANNELS)}">
		<cyclos:menu url="/do/admin/memberBulkActions" key="menu.admin.usersGroups.membersBulkAction"/>
	</c:if>
	<cyclos:menu url="/do/admin/importMembers" key="menu.admin.usersGroups.importMembers" permission="${AdminMemberPermission.MEMBERS_IMPORT}" />
	<cyclos:menu url="/do/admin/searchAdmins" key="menu.admin.usersGroups.admins" permission="${AdminAdminPermission.ADMINS_VIEW}" />
	<c:if test="${cyclos:granted(AdminSystemPermission.STATUS_VIEW_CONNECTED_ADMINS) || cyclos:granted(AdminSystemPermission.STATUS_VIEW_CONNECTED_BROKERS) || cyclos:granted(AdminSystemPermission.STATUS_VIEW_CONNECTED_MEMBERS)}">
		<cyclos:menu url="/do/admin/listConnectedUsers" key="menu.admin.usersGroups.connectedUsers"/>
	</c:if>
	<cyclos:menu url="/do/admin/searchPendingMembers" key="menu.admin.usersGroups.pendingMembers" permission="${AdminMemberPermission.MEMBERS_MANAGE_PENDING}" />
	<cyclos:menu url="/do/admin/listRegistrationAgreements" key="menu.admin.usersGroups.registrationAgreements" permission="${AdminSystemPermission.REGISTRATION_AGREEMENTS_VIEW}" />
	<c:if test="${cyclos:granted(AdminSystemPermission.ADMIN_GROUPS_VIEW) || cyclos:granted(AdminMemberPermission.GROUPS_VIEW) }">
		<cyclos:menu url="/do/admin/listGroups" key="menu.admin.usersGroups.groups"/>
	</c:if>
	<cyclos:menu url="/do/admin/listGroupFilters" key="menu.admin.usersGroups.groupFilters" permission="${AdminSystemPermission.GROUP_FILTERS_VIEW}" />
	<cyclos:menu url="/do/admin/searchLoanGroups" key="menu.admin.usersGroups.loanGroups" permission="${AdminSystemPermission.LOAN_GROUPS_VIEW}" />
	<cyclos:menu url="/do/admin/listMemberRecordTypes" key="menu.admin.usersGroups.memberRecordTypes" permission="${AdminSystemPermission.MEMBER_RECORD_TYPES_VIEW}" />
	<c:forEach var="memberRecordType" items="${memberRecordTypesInMenu}">
		<cyclos:menu url="/do/admin/searchMemberRecords?typeId=${memberRecordType.id}&global=true" label="${memberRecordType.label}" />
	</c:forEach>
</cyclos:menu>
<cyclos:menu key="menu.admin.accessDevices">
	<cyclos:menu url="/do/admin/manageCardTypes" key="menu.admin.accessDevices.cardType.manage" permission="${AdminSystemPermission.CARD_TYPES_VIEW}" />
	<cyclos:menu url="/do/admin/searchCards" key="menu.admin.accessDevices.cards.search" permission="${AdminMemberPermission.CARDS_VIEW}" />
	<cyclos:menu url="/do/admin/searchPos" key="menu.admin.accessDevices.pos.search" permission="${AdminMemberPermission.POS_VIEW}" />
</cyclos:menu>
<cyclos:menu key="menu.admin.messages">
	<cyclos:menu url="/do/admin/searchMessages" key="menu.admin.messages.messages" permission="${AdminMemberPermission.MESSAGES_VIEW}" />
	<cyclos:menu url="/do/admin/listMessageCategories" key="menu.admin.messages.messageCategory" permission="${AdminSystemPermission.MESSAGE_CATEGORIES_VIEW}"/>
	<cyclos:menu url="/do/admin/searchSmsMailings" key="menu.admin.messages.smsMailings" permission="${AdminMemberPermission.SMS_MAILINGS_VIEW}"/>
</cyclos:menu>
<cyclos:menu key="menu.admin.settings">
	<cyclos:menu url="/do/admin/editLocalSettings" key="menu.admin.settings.local" permission="${AdminSystemPermission.SETTINGS_VIEW}" />
	<cyclos:menu url="/do/admin/editAlertSettings" key="menu.admin.settings.alert" permission="${AdminSystemPermission.SETTINGS_VIEW}" />
	<cyclos:menu url="/do/admin/editAccessSettings" key="menu.admin.settings.access" permission="${AdminSystemPermission.SETTINGS_VIEW}" />
	<cyclos:menu url="/do/admin/editMailSettings" key="menu.admin.settings.mail" permission="${AdminSystemPermission.SETTINGS_VIEW}" />
	<cyclos:menu url="/do/admin/editLogSettings" key="menu.admin.settings.log" permission="${AdminSystemPermission.SETTINGS_VIEW}" />
	<cyclos:menu url="/do/admin/listChannels" key="menu.admin.settings.channels" permission="${AdminSystemPermission.CHANNELS_VIEW}" />
	<cyclos:menu url="/do/admin/searchServiceClients" key="menu.admin.settings.serviceClients" permission="${AdminSystemPermission.SERVICE_CLIENTS_VIEW}" />
	<cyclos:menu url="/do/admin/adminTasks" key="menu.admin.settings.adminTasks" module="${Module.SYSTEM_TASKS}" />
	<cyclos:menu url="/do/admin/manageSettings" key="menu.admin.settings.file" permission="${AdminSystemPermission.SETTINGS_FILE}" />
</cyclos:menu>
<cyclos:menu key="menu.admin.customFields" module="${Module.SYSTEM_CUSTOM_FIELDS}">
	<cyclos:menu url="/do/admin/listCustomFields?nature=MEMBER" key="menu.admin.customFields.memberFields"/>
	<cyclos:menu url="/do/admin/listCustomFields?nature=ADMIN" key="menu.admin.customFields.adminFields"/>
	<cyclos:menu url="/do/admin/listCustomFields?nature=AD" key="menu.admin.customFields.adFields"/>
	<cyclos:menu url="/do/admin/listCustomFields?nature=LOAN_GROUP" key="menu.admin.customFields.loanGroupFields"/>
</cyclos:menu>
<cyclos:menu key="menu.admin.contentManagement">
	<cyclos:menu url="/do/admin/listCustomizedFiles?type=STATIC_FILE" key="menu.admin.contentManagement.staticFiles" permission="${AdminSystemPermission.CUSTOMIZED_FILES_VIEW}" />
	<cyclos:menu url="/do/admin/listCustomizedFiles?type=HELP" key="menu.admin.contentManagement.helpFiles" permission="${AdminSystemPermission.CUSTOMIZED_FILES_VIEW}" />
	<cyclos:menu url="/do/admin/listCustomizedFiles?type=STYLE" key="menu.admin.contentManagement.cssFiles" permission="${AdminSystemPermission.CUSTOMIZED_FILES_VIEW}" />
	<cyclos:menu url="/do/admin/listCustomizedFiles?type=APPLICATION_PAGE" key="menu.admin.contentManagement.applicationPage" permission="${AdminSystemPermission.CUSTOMIZED_FILES_VIEW}" />
	<cyclos:menu url="/do/admin/systemImages" key="menu.admin.contentManagement.systemImages" permission="${AdminSystemPermission.CUSTOM_IMAGES_VIEW}" />
	<cyclos:menu url="/do/admin/customImages?nature=CUSTOM" key="menu.admin.contentManagement.customImages" permission="${AdminSystemPermission.CUSTOM_IMAGES_VIEW}" />
	<cyclos:menu url="/do/admin/customImages?nature=STYLE" key="menu.admin.contentManagement.styleImages" permission="${AdminSystemPermission.CUSTOM_IMAGES_VIEW}" />
	<cyclos:menu url="/do/admin/selectTheme" key="menu.admin.contentManagement.manageThemes" module="${Module.SYSTEM_THEMES}" />
	<c:if test="${cyclos:granted(AdminMemberPermission.DOCUMENTS_MANAGE_DYNAMIC) || cyclos:granted(AdminMemberPermission.DOCUMENTS_MANAGE_STATIC) }">
		<cyclos:menu url="/do/admin/listDocuments" key="menu.admin.contentManagement.documents"/>
	</c:if>
	<cyclos:menu url="/do/admin/searchInfoTexts" key="menu.admin.messages.infoTexts" permission="${AdminSystemPermission.INFO_TEXTS_VIEW}"/>	
</cyclos:menu>
<cyclos:menu key="menu.admin.translation">
	<cyclos:menu url="/do/admin/searchTranslationMessages" key="menu.admin.translation.application" permission="${AdminSystemPermission.TRANSLATION_VIEW}" />
	<cyclos:menu url="/do/admin/listMessageSettings" key="menu.admin.translation.internalMessages" permission="${AdminSystemPermission.TRANSLATION_MANAGE_NOTIFICATION}" />
	<cyclos:menu url="/do/admin/editMailTranslation" key="menu.admin.translation.mails" permission="${AdminSystemPermission.TRANSLATION_MANAGE_MAIL_TRANSLATION}" />
	<cyclos:menu url="/do/admin/manageTranslationMessages" key="menu.admin.translation.file" permission="${AdminSystemPermission.TRANSLATION_FILE}" />
</cyclos:menu>
<cyclos:menu key="menu.admin.reports">
	<cyclos:menu url="/do/admin/reportsCurrentState" key="menu.admin.reports.current" permission="${AdminSystemPermission.REPORTS_CURRENT}" />
	<cyclos:menu url="/do/admin/membersListReport" key="menu.admin.reports.members.list" permission="${AdminSystemPermission.REPORTS_MEMBER_LIST}" />
	<cyclos:menu url="/do/admin/membersTransactionsReport" key="menu.admin.reports.members" permission="${AdminSystemPermission.REPORTS_MEMBER_LIST}" />
	<cyclos:menu url="/do/admin/membersSmsLogsReport" key="menu.admin.reports.sms" permission="${AdminSystemPermission.REPORTS_SMS_LOGS}" />
	<cyclos:menu url="/do/admin/statistics" key="menu.admin.reports.statistics" permission="${AdminSystemPermission.REPORTS_STATISTICS}" />
</cyclos:menu>
<cyclos:menu key="menu.admin.help">
	<cyclos:menu url="/do/admin/manual" key="menu.admin.help.manual" />
	<cyclos:menu url="/do/admin/about" key="menu.about" />
</cyclos:menu>
<cyclos:menu url="/do/logout" key="menu.admin.logout" confirmationKey="menu.logout.confirmationMessage"/>
