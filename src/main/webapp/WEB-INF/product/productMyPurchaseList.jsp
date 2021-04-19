<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>



<div style="width: 70%; margin: 0 auto;">
	<div class="row">
		<div class="col-md-12">
			<div class="cart-table">
				<br><br>
				<h3 align="center" class="group-input">
					<b>My Purchase List</b> <br><br>
				</h3>

				<table>
					<thead>
						<tr>
							<th>거래번호</th>
							<th>구매 상품 번호</th>
							<th>판매자</th>
							<th>구매날짜</th>
							<th>구매내역 삭제 <i class="ti-close"></i></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mdlist" items="${mdlists }">
							<tr align="center">
								<th class="group-input"><label>${mdlist.no } </label></th>
								<th class="group-input"><label>${mdlist.productNo }
								</label></th>
								<th class="group-input"><label><a href="tradeDetail.mb?sellerid=${mdlist.sellerId }">${mdlist.sellerId }</a>
								</label></th>
								<th class="group-input"><label> <fmt:parseDate
											value="${mdlist.dealDate } " var="dealDate"
											pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dealDate }"
											pattern="yyyy-MM-dd" />
								</label></th>
								<th> <a href=""><i class="ti-close"></i></a> </th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>

</td>
</table>



<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>