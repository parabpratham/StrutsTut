<table align="right">
	<tr align="center">
		<td align="right">
			<bean:message key="login.email" />
		</td>
		<td align="left">
			&nbsp;
			<input type="text" id="email" name="email" maxlength="15" size="15"
				value="" onchange="return checkEmail(this)">
		</td>
		<td align="right">
			<bean:message key="login.password" />
		</td>
		<td align="left">
			&nbsp;
			<input type="password" id="password" name="password" maxlength="15"
				size="15" value="">
		</td>
		<td align="center">
			<html:submit property="method">
				<bean:message key="login.button.signon" />
			</html:submit>
		</td>
	</tr>
	<tr align="right">
		<td align="">
			&nbsp;
		</td>
		<td align="left">
			&nbsp;
			<html:errors property="email" />
			<div id="emailerror" style="display: none;  font-size: -1;" />
		</td>
		<td align="right">
			&nbsp;
		</td>
		<td align="left">
			&nbsp;
			<html:errors property="password" />
			<div id="passworderror" style="display: none; font-size: -1;" />
		</td>
		<td align="center">
			<html:errors property="login" />
		</td>
	</tr>
</table>