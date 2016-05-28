.class final Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
.super Lcom/facebook/model/GraphObject$Factory$ProxyBase;
.source "GraphObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/model/GraphObject$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GraphObjectProxy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/model/GraphObject$Factory$ProxyBase",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# static fields
.field private static final CASTTOMAP_METHOD:Ljava/lang/String; = "asMap"

.field private static final CAST_METHOD:Ljava/lang/String; = "cast"

.field private static final CLEAR_METHOD:Ljava/lang/String; = "clear"

.field private static final CONTAINSKEY_METHOD:Ljava/lang/String; = "containsKey"

.field private static final CONTAINSVALUE_METHOD:Ljava/lang/String; = "containsValue"

.field private static final ENTRYSET_METHOD:Ljava/lang/String; = "entrySet"

.field private static final GETINNERJSONOBJECT_METHOD:Ljava/lang/String; = "getInnerJSONObject"

.field private static final GETPROPERTYASLIST_METHOD:Ljava/lang/String; = "getPropertyAsList"

.field private static final GETPROPERTYAS_METHOD:Ljava/lang/String; = "getPropertyAs"

.field private static final GETPROPERTY_METHOD:Ljava/lang/String; = "getProperty"

.field private static final GET_METHOD:Ljava/lang/String; = "get"

.field private static final ISEMPTY_METHOD:Ljava/lang/String; = "isEmpty"

.field private static final KEYSET_METHOD:Ljava/lang/String; = "keySet"

.field private static final PUTALL_METHOD:Ljava/lang/String; = "putAll"

.field private static final PUT_METHOD:Ljava/lang/String; = "put"

.field private static final REMOVEPROPERTY_METHOD:Ljava/lang/String; = "removeProperty"

.field private static final REMOVE_METHOD:Ljava/lang/String; = "remove"

.field private static final SETPROPERTY_METHOD:Ljava/lang/String; = "setProperty"

.field private static final SIZE_METHOD:Ljava/lang/String; = "size"

.field private static final VALUES_METHOD:Ljava/lang/String; = "values"


# instance fields
.field private final graphObjectClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/Class;)V
    .registers 3
    .param p1, "state"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 503
    .local p2, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/facebook/model/GraphObject$Factory$ProxyBase;-><init>(Ljava/lang/Object;)V

    .line 504
    iput-object p2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->graphObjectClass:Ljava/lang/Class;

    .line 505
    return-void
.end method

.method private createGraphObjectsFromParameters(Lcom/facebook/model/CreateGraphObject;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "createGraphObject"    # Lcom/facebook/model/CreateGraphObject;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 629
    if-eqz p1, :cond_30

    .line 630
    invoke-interface {p1}, Lcom/facebook/model/CreateGraphObject;->value()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_30

    .line 631
    invoke-interface {p1}, Lcom/facebook/model/CreateGraphObject;->value()Ljava/lang/String;

    move-result-object v3

    .line 632
    .local v3, "propertyName":Ljava/lang/String;
    const-class v5, Ljava/util/List;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_40

    .line 633
    const-class v5, Lcom/facebook/model/GraphObject;

    invoke-static {v5}, Lcom/facebook/model/GraphObject$Factory;->createList(Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;

    move-result-object v1

    .local v1, "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    move-object v4, p2

    .line 635
    check-cast v4, Ljava/util/List;

    .line 636
    .local v4, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_29
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_31

    .line 642
    move-object p2, v1

    .line 651
    .end local v1    # "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    .end local v3    # "propertyName":Ljava/lang/String;
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local p2    # "value":Ljava/lang/Object;
    :cond_30
    :goto_30
    return-object p2

    .line 636
    .restart local v1    # "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    .restart local v3    # "propertyName":Ljava/lang/String;
    .restart local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_31
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 637
    .local v2, "obj":Ljava/lang/Object;
    invoke-static {}, Lcom/facebook/model/GraphObject$Factory;->create()Lcom/facebook/model/GraphObject;

    move-result-object v0

    .line 638
    .local v0, "graphObject":Lcom/facebook/model/GraphObject;
    invoke-interface {v0, v3, v2}, Lcom/facebook/model/GraphObject;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 639
    invoke-interface {v1, v0}, Lcom/facebook/model/GraphObjectList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 644
    .end local v0    # "graphObject":Lcom/facebook/model/GraphObject;
    .end local v1    # "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    .end local v2    # "obj":Ljava/lang/Object;
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_40
    invoke-static {}, Lcom/facebook/model/GraphObject$Factory;->create()Lcom/facebook/model/GraphObject;

    move-result-object v0

    .line 645
    .restart local v0    # "graphObject":Lcom/facebook/model/GraphObject;
    invoke-interface {v0, v3, p2}, Lcom/facebook/model/GraphObject;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 647
    move-object p2, v0

    .local p2, "value":Lcom/facebook/model/GraphObject;
    goto :goto_30
.end method

.method private final proxyGraphObjectGettersAndSetters(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 655
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    .line 656
    .local v4, "methodName":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    array-length v5, v9

    .line 657
    .local v5, "parameterCount":I
    const-class v9, Lcom/facebook/model/PropertyName;

    invoke-virtual {p1, v9}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    check-cast v7, Lcom/facebook/model/PropertyName;

    .line 659
    .local v7, "propertyNameOverride":Lcom/facebook/model/PropertyName;
    if-eqz v7, :cond_36

    invoke-interface {v7}, Lcom/facebook/model/PropertyName;->value()Ljava/lang/String;

    move-result-object v3

    .line 663
    .local v3, "key":Ljava/lang/String;
    :goto_17
    if-nez v5, :cond_40

    .line 665
    iget-object v9, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v9, Lorg/json/JSONObject;

    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 667
    .local v8, "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 669
    .local v1, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 670
    .local v2, "genericReturnType":Ljava/lang/reflect/Type;
    const/4 v6, 0x0

    .line 671
    .local v6, "parameterizedReturnType":Ljava/lang/reflect/ParameterizedType;
    instance-of v9, v2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v9, :cond_31

    move-object v6, v2

    .line 672
    check-cast v6, Ljava/lang/reflect/ParameterizedType;

    .line 675
    :cond_31
    invoke-static {v8, v1, v6}, Lcom/facebook/model/GraphObject$Factory;->coerceValueToExpectedType(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Object;

    move-result-object v8

    .line 690
    .end local v1    # "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "genericReturnType":Ljava/lang/reflect/Type;
    .end local v6    # "parameterizedReturnType":Ljava/lang/reflect/ParameterizedType;
    .end local v8    # "value":Ljava/lang/Object;
    :goto_35
    return-object v8

    .line 660
    .end local v3    # "key":Ljava/lang/String;
    :cond_36
    const/4 v9, 0x3

    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/facebook/model/GraphObject$Factory;->convertCamelCaseToLowercaseWithUnderscores(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_17

    .line 678
    .restart local v3    # "key":Ljava/lang/String;
    :cond_40
    const/4 v9, 0x1

    if-ne v5, v9, :cond_5f

    .line 680
    const-class v9, Lcom/facebook/model/CreateGraphObject;

    invoke-virtual {p1, v9}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/facebook/model/CreateGraphObject;

    .line 681
    .local v0, "createGraphObjectAnnotation":Lcom/facebook/model/CreateGraphObject;
    const/4 v9, 0x0

    aget-object v9, p2, v9

    invoke-direct {p0, v0, v9}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->createGraphObjectsFromParameters(Lcom/facebook/model/CreateGraphObject;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 685
    .restart local v8    # "value":Ljava/lang/Object;
    # invokes: Lcom/facebook/model/GraphObject$Factory;->getUnderlyingJSONObject(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v8}, Lcom/facebook/model/GraphObject$Factory;->access$2(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 686
    iget-object v9, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v9, Lorg/json/JSONObject;

    invoke-virtual {v9, v3, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 687
    const/4 v8, 0x0

    goto :goto_35

    .line 690
    .end local v0    # "createGraphObjectAnnotation":Lcom/facebook/model/CreateGraphObject;
    .end local v8    # "value":Ljava/lang/Object;
    :cond_5f
    invoke-virtual {p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->throwUnexpectedMethodSignature(Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_35
.end method

.method private final proxyGraphObjectMethods(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 574
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    .line 575
    .local v3, "methodName":Ljava/lang/String;
    const-string v7, "cast"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_27

    .line 577
    aget-object v1, p3, v8

    check-cast v1, Ljava/lang/Class;

    .line 579
    .local v1, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    if-eqz v1, :cond_1e

    .line 580
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->graphObjectClass:Ljava/lang/Class;

    invoke-virtual {v1, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 625
    .end local v1    # "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    .end local p1    # "proxy":Ljava/lang/Object;
    :goto_1d
    return-object p1

    .line 583
    .restart local v1    # "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    .restart local p1    # "proxy":Ljava/lang/Object;
    :cond_1e
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    # invokes: Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;
    invoke-static {v1, v7}, Lcom/facebook/model/GraphObject$Factory;->access$0(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object p1

    goto :goto_1d

    .line 584
    .end local v1    # "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    :cond_27
    const-string v7, "getInnerJSONObject"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 585
    invoke-static {p1}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v2

    .local v2, "handler":Ljava/lang/reflect/InvocationHandler;
    move-object v4, v2

    .line 586
    check-cast v4, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;

    .line 587
    .local v4, "otherProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    iget-object p1, v4, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    goto :goto_1d

    .line 588
    .end local v2    # "handler":Ljava/lang/reflect/InvocationHandler;
    .end local v4    # "otherProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    :cond_39
    const-string v7, "asMap"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 589
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    # invokes: Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxyForMap(Lorg/json/JSONObject;)Ljava/util/Map;
    invoke-static {v7}, Lcom/facebook/model/GraphObject$Factory;->access$1(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p1

    goto :goto_1d

    .line 590
    :cond_4a
    const-string v7, "getProperty"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5f

    .line 591
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    aget-object v8, p3, v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_1d

    .line 592
    :cond_5f
    const-string v7, "getPropertyAs"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7c

    .line 593
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    aget-object v8, p3, v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 594
    .local v6, "value":Ljava/lang/Object;
    aget-object v0, p3, v10

    check-cast v0, Ljava/lang/Class;

    .line 596
    .local v0, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v6, v0, v9}, Lcom/facebook/model/GraphObject$Factory;->coerceValueToExpectedType(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_1d

    .line 597
    .end local v0    # "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "value":Ljava/lang/Object;
    :cond_7c
    const-string v7, "getPropertyAsList"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a1

    .line 598
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    aget-object v8, p3, v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 599
    .restart local v6    # "value":Ljava/lang/Object;
    aget-object v0, p3, v10

    check-cast v0, Ljava/lang/Class;

    .line 601
    .restart local v0    # "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy$1;

    invoke-direct {v5, p0, v0}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy$1;-><init>(Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;Ljava/lang/Class;)V

    .line 617
    .local v5, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    const-class v7, Lcom/facebook/model/GraphObjectList;

    invoke-static {v6, v7, v5}, Lcom/facebook/model/GraphObject$Factory;->coerceValueToExpectedType(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Object;

    move-result-object p1

    goto/16 :goto_1d

    .line 618
    .end local v0    # "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_a1
    const-string v7, "setProperty"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_af

    .line 619
    invoke-direct {p0, p3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->setJSONProperty([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto/16 :goto_1d

    .line 620
    :cond_af
    const-string v7, "removeProperty"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c5

    .line 621
    iget-object v7, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v7, Lorg/json/JSONObject;

    aget-object v8, p3, v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-object p1, v9

    .line 622
    goto/16 :goto_1d

    .line 625
    :cond_c5
    invoke-virtual {p0, p2}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->throwUnexpectedMethodSignature(Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object p1

    goto/16 :goto_1d
.end method

.method private final proxyMapMethods(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 530
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 531
    .local v2, "methodName":Ljava/lang/String;
    const-string v3, "clear"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 532
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/facebook/model/JsonUtil;->jsonObjectClear(Lorg/json/JSONObject;)V

    move-object v3, v5

    .line 570
    :goto_16
    return-object v3

    .line 534
    :cond_17
    const-string v3, "containsKey"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 535
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    aget-object v4, p2, v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_16

    .line 536
    :cond_30
    const-string v3, "containsValue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 537
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    aget-object v4, p2, v4

    invoke-static {v3, v4}, Lcom/facebook/model/JsonUtil;->jsonObjectContainsValue(Lorg/json/JSONObject;Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_16

    .line 538
    :cond_47
    const-string v3, "entrySet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_58

    .line 539
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/facebook/model/JsonUtil;->jsonObjectEntrySet(Lorg/json/JSONObject;)Ljava/util/Set;

    move-result-object v3

    goto :goto_16

    .line 540
    :cond_58
    const-string v3, "get"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6d

    .line 541
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    aget-object v4, p2, v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_16

    .line 542
    :cond_6d
    const-string v3, "isEmpty"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8a

    .line 543
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v3

    if-nez v3, :cond_85

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_16

    :cond_85
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_16

    .line 544
    :cond_8a
    const-string v3, "keySet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9c

    .line 545
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/facebook/model/JsonUtil;->jsonObjectKeySet(Lorg/json/JSONObject;)Ljava/util/Set;

    move-result-object v3

    goto/16 :goto_16

    .line 546
    :cond_9c
    const-string v3, "put"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_aa

    .line 547
    invoke-direct {p0, p2}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->setJSONProperty([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto/16 :goto_16

    .line 548
    :cond_aa
    const-string v3, "putAll"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_da

    .line 549
    const/4 v1, 0x0

    .line 550
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    aget-object v3, p2, v4

    instance-of v3, v3, Ljava/util/Map;

    if-eqz v3, :cond_c8

    .line 552
    aget-object v0, p2, v4

    check-cast v0, Ljava/util/Map;

    .line 553
    .local v0, "castMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object v1, v0

    .line 559
    .end local v0    # "castMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_be
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3, v1}, Lcom/facebook/model/JsonUtil;->jsonObjectPutAll(Lorg/json/JSONObject;Ljava/util/Map;)V

    move-object v3, v5

    .line 560
    goto/16 :goto_16

    .line 554
    :cond_c8
    aget-object v3, p2, v4

    instance-of v3, v3, Lcom/facebook/model/GraphObject;

    if-eqz v3, :cond_d7

    .line 555
    aget-object v3, p2, v4

    check-cast v3, Lcom/facebook/model/GraphObject;

    invoke-interface {v3}, Lcom/facebook/model/GraphObject;->asMap()Ljava/util/Map;

    move-result-object v1

    .line 556
    goto :goto_be

    :cond_d7
    move-object v3, v5

    .line 557
    goto/16 :goto_16

    .line 561
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_da
    const-string v3, "remove"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f0

    .line 562
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    aget-object v4, p2, v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-object v3, v5

    .line 563
    goto/16 :goto_16

    .line 564
    :cond_f0
    const-string v3, "size"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_106

    .line 565
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_16

    .line 566
    :cond_106
    const-string v3, "values"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_118

    .line 567
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/facebook/model/JsonUtil;->jsonObjectValues(Lorg/json/JSONObject;)Ljava/util/Collection;

    move-result-object v3

    goto/16 :goto_16

    .line 570
    :cond_118
    invoke-virtual {p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->throwUnexpectedMethodSignature(Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v3

    goto/16 :goto_16
.end method

.method private setJSONProperty([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 694
    const/4 v4, 0x0

    aget-object v1, p1, v4

    check-cast v1, Ljava/lang/String;

    .line 695
    .local v1, "name":Ljava/lang/String;
    const/4 v4, 0x1

    aget-object v2, p1, v4

    .line 696
    .local v2, "property":Ljava/lang/Object;
    # invokes: Lcom/facebook/model/GraphObject$Factory;->getUnderlyingJSONObject(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v2}, Lcom/facebook/model/GraphObject$Factory;->access$2(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 698
    .local v3, "value":Ljava/lang/Object;
    :try_start_c
    iget-object v4, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    check-cast v4, Lorg/json/JSONObject;

    invoke-virtual {v4, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_13} :catch_15

    .line 702
    const/4 v4, 0x0

    return-object v4

    .line 699
    :catch_15
    move-exception v0

    .line 700
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 514
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 516
    .local v0, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_d

    .line 517
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->proxyObjectMethods(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 526
    :goto_c
    return-object v1

    .line 518
    :cond_d
    const-class v1, Ljava/util/Map;

    if-ne v0, v1, :cond_16

    .line 519
    invoke-direct {p0, p2, p3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->proxyMapMethods(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 520
    :cond_16
    const-class v1, Lcom/facebook/model/GraphObject;

    if-ne v0, v1, :cond_1f

    .line 521
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->proxyGraphObjectMethods(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 522
    :cond_1f
    const-class v1, Lcom/facebook/model/GraphObject;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 523
    invoke-direct {p0, p2, p3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->proxyGraphObjectGettersAndSetters(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 526
    :cond_2c
    invoke-virtual {p0, p2}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->throwUnexpectedMethodSignature(Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 509
    const-string v0, "GraphObject{graphObjectClass=%s, state=%s}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->graphObjectClass:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
