package com.hu.book.model;

import java.util.ArrayList;
import java.util.List;

public class BookExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BookExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNull() {
            addCriterion("bookname is null");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNotNull() {
            addCriterion("bookname is not null");
            return (Criteria) this;
        }

        public Criteria andBooknameEqualTo(String value) {
            addCriterion("bookname =", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotEqualTo(String value) {
            addCriterion("bookname <>", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThan(String value) {
            addCriterion("bookname >", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThanOrEqualTo(String value) {
            addCriterion("bookname >=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThan(String value) {
            addCriterion("bookname <", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThanOrEqualTo(String value) {
            addCriterion("bookname <=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLike(String value) {
            addCriterion("bookname like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotLike(String value) {
            addCriterion("bookname not like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameIn(List<String> values) {
            addCriterion("bookname in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotIn(List<String> values) {
            addCriterion("bookname not in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameBetween(String value1, String value2) {
            addCriterion("bookname between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotBetween(String value1, String value2) {
            addCriterion("bookname not between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andBookidentyIsNull() {
            addCriterion("bookidenty is null");
            return (Criteria) this;
        }

        public Criteria andBookidentyIsNotNull() {
            addCriterion("bookidenty is not null");
            return (Criteria) this;
        }

        public Criteria andBookidentyEqualTo(String value) {
            addCriterion("bookidenty =", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyNotEqualTo(String value) {
            addCriterion("bookidenty <>", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyGreaterThan(String value) {
            addCriterion("bookidenty >", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyGreaterThanOrEqualTo(String value) {
            addCriterion("bookidenty >=", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyLessThan(String value) {
            addCriterion("bookidenty <", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyLessThanOrEqualTo(String value) {
            addCriterion("bookidenty <=", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyLike(String value) {
            addCriterion("bookidenty like", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyNotLike(String value) {
            addCriterion("bookidenty not like", value, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyIn(List<String> values) {
            addCriterion("bookidenty in", values, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyNotIn(List<String> values) {
            addCriterion("bookidenty not in", values, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyBetween(String value1, String value2) {
            addCriterion("bookidenty between", value1, value2, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andBookidentyNotBetween(String value1, String value2) {
            addCriterion("bookidenty not between", value1, value2, "bookidenty");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNull() {
            addCriterion("author is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNotNull() {
            addCriterion("author is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorEqualTo(String value) {
            addCriterion("author =", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotEqualTo(String value) {
            addCriterion("author <>", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThan(String value) {
            addCriterion("author >", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThanOrEqualTo(String value) {
            addCriterion("author >=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThan(String value) {
            addCriterion("author <", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThanOrEqualTo(String value) {
            addCriterion("author <=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLike(String value) {
            addCriterion("author like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotLike(String value) {
            addCriterion("author not like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorIn(List<String> values) {
            addCriterion("author in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotIn(List<String> values) {
            addCriterion("author not in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorBetween(String value1, String value2) {
            addCriterion("author between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotBetween(String value1, String value2) {
            addCriterion("author not between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andPublisherIsNull() {
            addCriterion("publisher is null");
            return (Criteria) this;
        }

        public Criteria andPublisherIsNotNull() {
            addCriterion("publisher is not null");
            return (Criteria) this;
        }

        public Criteria andPublisherEqualTo(String value) {
            addCriterion("publisher =", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotEqualTo(String value) {
            addCriterion("publisher <>", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherGreaterThan(String value) {
            addCriterion("publisher >", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherGreaterThanOrEqualTo(String value) {
            addCriterion("publisher >=", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLessThan(String value) {
            addCriterion("publisher <", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLessThanOrEqualTo(String value) {
            addCriterion("publisher <=", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLike(String value) {
            addCriterion("publisher like", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotLike(String value) {
            addCriterion("publisher not like", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherIn(List<String> values) {
            addCriterion("publisher in", values, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotIn(List<String> values) {
            addCriterion("publisher not in", values, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherBetween(String value1, String value2) {
            addCriterion("publisher between", value1, value2, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotBetween(String value1, String value2) {
            addCriterion("publisher not between", value1, value2, "publisher");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Double value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Double value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Double value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Double value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Double value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Double> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Double> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Double value1, Double value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Double value1, Double value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andShelftimeIsNull() {
            addCriterion("shelftime is null");
            return (Criteria) this;
        }

        public Criteria andShelftimeIsNotNull() {
            addCriterion("shelftime is not null");
            return (Criteria) this;
        }

        public Criteria andShelftimeEqualTo(String value) {
            addCriterion("shelftime =", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeNotEqualTo(String value) {
            addCriterion("shelftime <>", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeGreaterThan(String value) {
            addCriterion("shelftime >", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeGreaterThanOrEqualTo(String value) {
            addCriterion("shelftime >=", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeLessThan(String value) {
            addCriterion("shelftime <", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeLessThanOrEqualTo(String value) {
            addCriterion("shelftime <=", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeLike(String value) {
            addCriterion("shelftime like", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeNotLike(String value) {
            addCriterion("shelftime not like", value, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeIn(List<String> values) {
            addCriterion("shelftime in", values, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeNotIn(List<String> values) {
            addCriterion("shelftime not in", values, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeBetween(String value1, String value2) {
            addCriterion("shelftime between", value1, value2, "shelftime");
            return (Criteria) this;
        }

        public Criteria andShelftimeNotBetween(String value1, String value2) {
            addCriterion("shelftime not between", value1, value2, "shelftime");
            return (Criteria) this;
        }

        public Criteria andRemainIsNull() {
            addCriterion("remain is null");
            return (Criteria) this;
        }

        public Criteria andRemainIsNotNull() {
            addCriterion("remain is not null");
            return (Criteria) this;
        }

        public Criteria andRemainEqualTo(Integer value) {
            addCriterion("remain =", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainNotEqualTo(Integer value) {
            addCriterion("remain <>", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainGreaterThan(Integer value) {
            addCriterion("remain >", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainGreaterThanOrEqualTo(Integer value) {
            addCriterion("remain >=", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainLessThan(Integer value) {
            addCriterion("remain <", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainLessThanOrEqualTo(Integer value) {
            addCriterion("remain <=", value, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainIn(List<Integer> values) {
            addCriterion("remain in", values, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainNotIn(List<Integer> values) {
            addCriterion("remain not in", values, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainBetween(Integer value1, Integer value2) {
            addCriterion("remain between", value1, value2, "remain");
            return (Criteria) this;
        }

        public Criteria andRemainNotBetween(Integer value1, Integer value2) {
            addCriterion("remain not between", value1, value2, "remain");
            return (Criteria) this;
        }

        public Criteria andPicnameIsNull() {
            addCriterion("picname is null");
            return (Criteria) this;
        }

        public Criteria andPicnameIsNotNull() {
            addCriterion("picname is not null");
            return (Criteria) this;
        }

        public Criteria andPicnameEqualTo(String value) {
            addCriterion("picname =", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameNotEqualTo(String value) {
            addCriterion("picname <>", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameGreaterThan(String value) {
            addCriterion("picname >", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameGreaterThanOrEqualTo(String value) {
            addCriterion("picname >=", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameLessThan(String value) {
            addCriterion("picname <", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameLessThanOrEqualTo(String value) {
            addCriterion("picname <=", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameLike(String value) {
            addCriterion("picname like", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameNotLike(String value) {
            addCriterion("picname not like", value, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameIn(List<String> values) {
            addCriterion("picname in", values, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameNotIn(List<String> values) {
            addCriterion("picname not in", values, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameBetween(String value1, String value2) {
            addCriterion("picname between", value1, value2, "picname");
            return (Criteria) this;
        }

        public Criteria andPicnameNotBetween(String value1, String value2) {
            addCriterion("picname not between", value1, value2, "picname");
            return (Criteria) this;
        }

        public Criteria andIntroductIsNull() {
            addCriterion("introduct is null");
            return (Criteria) this;
        }

        public Criteria andIntroductIsNotNull() {
            addCriterion("introduct is not null");
            return (Criteria) this;
        }

        public Criteria andIntroductEqualTo(String value) {
            addCriterion("introduct =", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductNotEqualTo(String value) {
            addCriterion("introduct <>", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductGreaterThan(String value) {
            addCriterion("introduct >", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductGreaterThanOrEqualTo(String value) {
            addCriterion("introduct >=", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductLessThan(String value) {
            addCriterion("introduct <", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductLessThanOrEqualTo(String value) {
            addCriterion("introduct <=", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductLike(String value) {
            addCriterion("introduct like", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductNotLike(String value) {
            addCriterion("introduct not like", value, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductIn(List<String> values) {
            addCriterion("introduct in", values, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductNotIn(List<String> values) {
            addCriterion("introduct not in", values, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductBetween(String value1, String value2) {
            addCriterion("introduct between", value1, value2, "introduct");
            return (Criteria) this;
        }

        public Criteria andIntroductNotBetween(String value1, String value2) {
            addCriterion("introduct not between", value1, value2, "introduct");
            return (Criteria) this;
        }

        public Criteria andClassifyIsNull() {
            addCriterion("classify is null");
            return (Criteria) this;
        }

        public Criteria andClassifyIsNotNull() {
            addCriterion("classify is not null");
            return (Criteria) this;
        }

        public Criteria andClassifyEqualTo(String value) {
            addCriterion("classify =", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyNotEqualTo(String value) {
            addCriterion("classify <>", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyGreaterThan(String value) {
            addCriterion("classify >", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyGreaterThanOrEqualTo(String value) {
            addCriterion("classify >=", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyLessThan(String value) {
            addCriterion("classify <", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyLessThanOrEqualTo(String value) {
            addCriterion("classify <=", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyLike(String value) {
            addCriterion("classify like", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyNotLike(String value) {
            addCriterion("classify not like", value, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyIn(List<String> values) {
            addCriterion("classify in", values, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyNotIn(List<String> values) {
            addCriterion("classify not in", values, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyBetween(String value1, String value2) {
            addCriterion("classify between", value1, value2, "classify");
            return (Criteria) this;
        }

        public Criteria andClassifyNotBetween(String value1, String value2) {
            addCriterion("classify not between", value1, value2, "classify");
            return (Criteria) this;
        }

        public Criteria andClassIdIsNull() {
            addCriterion("class_id is null");
            return (Criteria) this;
        }

        public Criteria andClassIdIsNotNull() {
            addCriterion("class_id is not null");
            return (Criteria) this;
        }

        public Criteria andClassIdEqualTo(Integer value) {
            addCriterion("class_id =", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotEqualTo(Integer value) {
            addCriterion("class_id <>", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThan(Integer value) {
            addCriterion("class_id >", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_id >=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThan(Integer value) {
            addCriterion("class_id <", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("class_id <=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdIn(List<Integer> values) {
            addCriterion("class_id in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotIn(List<Integer> values) {
            addCriterion("class_id not in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdBetween(Integer value1, Integer value2) {
            addCriterion("class_id between", value1, value2, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("class_id not between", value1, value2, "classId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}