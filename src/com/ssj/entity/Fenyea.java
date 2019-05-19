package com.ssj.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenyea<T> {
	private Integer page;
	private Integer pageSize;
	private List<T> rows;
	private Integer total;
	
	//²ÎÊý
	private T t;

	public Fenyea() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Fenyea(Integer page, Integer pageSize, List<T> rows, Integer total, T t) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.rows = rows;
		this.total = total;
		this.t = t;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	@Override
	public String toString() {
		return "Fenyea [page=" + page + ", pageSize=" + pageSize + ", rows=" + rows + ", total=" + total + ", t=" + t
				+ "]";
	}

	
	
}
