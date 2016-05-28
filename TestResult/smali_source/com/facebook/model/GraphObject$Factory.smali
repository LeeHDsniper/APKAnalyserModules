.class public final Lcom/facebook/model/GraphObject$Factory;
.super Ljava/lang/Object;
.source "GraphObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/model/GraphObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;,
        Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;,
        Lcom/facebook/model/GraphObject$Factory$ProxyBase;
    }
.end annotation


# static fields
.field private static final dateFormats:[Ljava/text/SimpleDateFormat;

.field private static final verifiedGraphObjectClasses:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 112
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/facebook/model/GraphObject$Factory;->verifiedGraphObjectClasses:Ljava/util/HashSet;

    .line 113
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/text/SimpleDateFormat;

    const/4 v1, 0x0

    .line 114
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 115
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v2, v0, v1

    .line 113
    sput-object v0, Lcom/facebook/model/GraphObject$Factory;->dateFormats:[Ljava/text/SimpleDateFormat;

    .line 115
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    return-void
.end method

.method static synthetic access$0(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;
    .registers 3

    .prologue
    .line 215
    invoke-static {p0, p1}, Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 2

    .prologue
    .line 227
    invoke-static {p0}, Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxyForMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .prologue
    .line 409
    invoke-static {p0}, Lcom/facebook/model/GraphObject$Factory;->getUnderlyingJSONObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static coerceValueToExpectedType(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Object;
    .registers 16
    .param p0, "value"    # Ljava/lang/Object;
    .param p2, "expectedTypeAsParameterizedType"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TU;>;",
            "Ljava/lang/reflect/ParameterizedType;",
            ")TU;"
        }
    .end annotation

    .prologue
    .local p1, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<TU;>;"
    const/4 v11, 0x1

    const/4 v9, 0x0

    .line 300
    if-nez p0, :cond_2b

    .line 301
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_11

    .line 303
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 392
    .end local p0    # "value":Ljava/lang/Object;
    :goto_10
    return-object v7

    .line 305
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_11
    sget-object v10, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1e

    .line 307
    invoke-static {v9}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    .line 308
    .local v7, "result":Ljava/lang/Character;, "TU;"
    goto :goto_10

    .line 309
    .end local v7    # "result":Ljava/lang/Character;, "TU;"
    :cond_1e
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v10

    if-eqz v10, :cond_29

    .line 311
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 312
    .local v7, "result":Ljava/lang/Integer;, "TU;"
    goto :goto_10

    .line 314
    .end local v7    # "result":Ljava/lang/Integer;, "TU;"
    :cond_29
    const/4 v7, 0x0

    goto :goto_10

    .line 318
    :cond_2b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    .line 319
    .local v8, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_37

    .line 321
    move-object v7, p0

    .line 322
    .local v7, "result":Ljava/lang/Object;, "TU;"
    goto :goto_10

    .line 325
    .end local v7    # "result":Ljava/lang/Object;, "TU;"
    :cond_37
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v10

    if-eqz v10, :cond_3f

    .line 328
    move-object v7, p0

    .line 329
    .restart local v7    # "result":Ljava/lang/Object;, "TU;"
    goto :goto_10

    .line 332
    .end local v7    # "result":Ljava/lang/Object;, "TU;"
    :cond_3f
    const-class v10, Lcom/facebook/model/GraphObject;

    invoke-virtual {v10, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_7f

    .line 334
    move-object v5, p1

    .line 337
    .local v5, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    const-class v9, Lorg/json/JSONObject;

    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_57

    .line 340
    check-cast p0, Lorg/json/JSONObject;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {v5, p0}, Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object v7

    .line 341
    .local v7, "result":Lcom/facebook/model/GraphObject;, "TU;"
    goto :goto_10

    .line 342
    .end local v7    # "result":Lcom/facebook/model/GraphObject;, "TU;"
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_57
    const-class v9, Lcom/facebook/model/GraphObject;

    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_66

    .line 345
    check-cast p0, Lcom/facebook/model/GraphObject;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0, v5}, Lcom/facebook/model/GraphObject;->cast(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v7

    .line 346
    .restart local v7    # "result":Lcom/facebook/model/GraphObject;, "TU;"
    goto :goto_10

    .line 348
    .end local v7    # "result":Lcom/facebook/model/GraphObject;, "TU;"
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_66
    new-instance v9, Lcom/facebook/FacebookGraphObjectException;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Can\'t create GraphObject from "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 350
    .end local v5    # "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/facebook/model/GraphObject;>;"
    :cond_7f
    const-class v10, Ljava/lang/Iterable;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9f

    const-class v10, Ljava/util/Collection;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9f

    .line 351
    const-class v10, Ljava/util/List;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9f

    const-class v10, Lcom/facebook/model/GraphObjectList;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ff

    .line 352
    :cond_9f
    if-nez p2, :cond_ba

    .line 353
    new-instance v9, Lcom/facebook/FacebookGraphObjectException;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "can\'t infer generic type of: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 356
    :cond_ba
    invoke-interface {p2}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 358
    .local v1, "actualTypeArguments":[Ljava/lang/reflect/Type;
    if-eqz v1, :cond_c9

    array-length v10, v1

    if-ne v10, v11, :cond_c9

    .line 359
    aget-object v10, v1, v9

    instance-of v10, v10, Ljava/lang/Class;

    if-nez v10, :cond_d1

    .line 360
    :cond_c9
    new-instance v9, Lcom/facebook/FacebookGraphObjectException;

    .line 361
    const-string v10, "Expect collection properties to be of a type with exactly one generic parameter."

    .line 360
    invoke-direct {v9, v10}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 363
    :cond_d1
    aget-object v2, v1, v9

    check-cast v2, Ljava/lang/Class;

    .line 365
    .local v2, "collectionGenericArgument":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v9, Lorg/json/JSONArray;

    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e6

    move-object v6, p0

    .line 366
    check-cast v6, Lorg/json/JSONArray;

    .line 368
    .local v6, "jsonArray":Lorg/json/JSONArray;
    invoke-static {v6, v2}, Lcom/facebook/model/GraphObject$Factory;->createList(Lorg/json/JSONArray;Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;

    move-result-object v7

    .line 369
    .local v7, "result":Lcom/facebook/model/GraphObjectList;, "TU;"
    goto/16 :goto_10

    .line 371
    .end local v6    # "jsonArray":Lorg/json/JSONArray;
    .end local v7    # "result":Lcom/facebook/model/GraphObjectList;, "TU;"
    :cond_e6
    new-instance v9, Lcom/facebook/FacebookGraphObjectException;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Can\'t create Collection from "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 373
    .end local v1    # "actualTypeArguments":[Ljava/lang/reflect/Type;
    .end local v2    # "collectionGenericArgument":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_ff
    const-class v10, Ljava/lang/String;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_137

    .line 374
    const-class v10, Ljava/lang/Double;

    invoke-virtual {v10, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_117

    .line 375
    const-class v10, Ljava/lang/Float;

    invoke-virtual {v10, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_123

    .line 377
    :cond_117
    const-string v10, "%f"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object p0, v11, v9

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 378
    .local v7, "result":Ljava/lang/String;, "TU;"
    goto/16 :goto_10

    .line 379
    .end local v7    # "result":Ljava/lang/String;, "TU;"
    :cond_123
    const-class v10, Ljava/lang/Number;

    invoke-virtual {v10, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_14d

    .line 381
    const-string v10, "%d"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object p0, v11, v9

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 382
    .restart local v7    # "result":Ljava/lang/String;, "TU;"
    goto/16 :goto_10

    .line 384
    .end local v7    # "result":Ljava/lang/String;, "TU;"
    :cond_137
    const-class v10, Ljava/util/Date;

    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_14d

    .line 385
    const-class v10, Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_14d

    .line 386
    sget-object v11, Lcom/facebook/model/GraphObject$Factory;->dateFormats:[Ljava/text/SimpleDateFormat;

    array-length v12, v11

    move v10, v9

    :goto_14b
    if-lt v10, v12, :cond_174

    .line 400
    :cond_14d
    new-instance v9, Lcom/facebook/FacebookGraphObjectException;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Can\'t convert type"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 401
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 400
    invoke-direct {v9, v10}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 386
    :cond_174
    aget-object v4, v11, v10

    .line 388
    .local v4, "format":Ljava/text/SimpleDateFormat;
    :try_start_176
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    move-object v9, v0

    invoke-virtual {v4, v9}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_17d
    .catch Ljava/text/ParseException; {:try_start_176 .. :try_end_17d} :catch_183

    move-result-object v3

    .line 389
    .local v3, "date":Ljava/util/Date;
    if-eqz v3, :cond_184

    .line 391
    move-object v7, v3

    .line 392
    .local v7, "result":Ljava/util/Date;, "TU;"
    goto/16 :goto_10

    .line 394
    .end local v3    # "date":Ljava/util/Date;
    .end local v7    # "result":Ljava/util/Date;, "TU;"
    :catch_183
    move-exception v9

    .line 386
    :cond_184
    add-int/lit8 v9, v10, 0x1

    move v10, v9

    goto :goto_14b
.end method

.method static convertCamelCaseToLowercaseWithUnderscores(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 405
    const-string v0, "([a-z])([A-Z])"

    const-string v1, "$1_$2"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 406
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static create()Lcom/facebook/model/GraphObject;
    .registers 1

    .prologue
    .line 154
    const-class v0, Lcom/facebook/model/GraphObject;

    invoke-static {v0}, Lcom/facebook/model/GraphObject$Factory;->create(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p0, v0}, Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;
    .registers 2
    .param p0, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 130
    const-class v0, Lcom/facebook/model/GraphObject;

    invoke-static {p0, v0}, Lcom/facebook/model/GraphObject$Factory;->create(Lorg/json/JSONObject;Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lorg/json/JSONObject;Ljava/lang/Class;)Lcom/facebook/model/GraphObject;
    .registers 3
    .param p0, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1, p0}, Lcom/facebook/model/GraphObject$Factory;->createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    return-object v0
.end method

.method private static createGraphObjectProxy(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;
    .registers 6
    .param p1, "state"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lorg/json/JSONObject;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0}, Lcom/facebook/model/GraphObject$Factory;->verifyCanProxyClass(Ljava/lang/Class;)V

    .line 218
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 219
    .local v2, "interfaces":[Ljava/lang/Class;
    new-instance v1, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;

    invoke-direct {v1, p1, p0}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    .line 222
    .local v1, "graphObjectProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    const-class v3, Lcom/facebook/model/GraphObject;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v3, v2, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/model/GraphObject;

    .line 224
    .local v0, "graphObject":Lcom/facebook/model/GraphObject;, "TT;"
    return-object v0
.end method

.method private static createGraphObjectProxyForMap(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 6
    .param p0, "state"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 228
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/util/Map;

    aput-object v4, v2, v3

    .line 229
    .local v2, "interfaces":[Ljava/lang/Class;
    new-instance v1, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;

    const-class v3, Ljava/util/Map;

    invoke-direct {v1, p0, v3}, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    .line 233
    .local v1, "graphObjectProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    const-class v3, Lcom/facebook/model/GraphObject;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v3, v2, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    .line 232
    check-cast v0, Ljava/util/Map;

    .line 235
    .local v0, "graphObject":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    return-object v0
.end method

.method public static createList(Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/facebook/model/GraphObjectList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 212
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-static {v0, p0}, Lcom/facebook/model/GraphObject$Factory;->createList(Lorg/json/JSONArray;Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;

    move-result-object v0

    return-object v0
.end method

.method public static createList(Lorg/json/JSONArray;Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;
    .registers 3
    .param p0, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/facebook/model/GraphObjectList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;

    invoke-direct {v0, p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;-><init>(Lorg/json/JSONArray;Ljava/lang/Class;)V

    return-object v0
.end method

.method private static getUnderlyingJSONObject(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 410
    if-nez p0, :cond_4

    .line 411
    const/4 v3, 0x0

    .line 433
    :cond_3
    :goto_3
    return-object v3

    .line 414
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 415
    .local v5, "objClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v6, Lcom/facebook/model/GraphObject;

    invoke-virtual {v6, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_18

    move-object v0, p0

    .line 416
    check-cast v0, Lcom/facebook/model/GraphObject;

    .line 417
    .local v0, "graphObject":Lcom/facebook/model/GraphObject;
    invoke-interface {v0}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_3

    .line 418
    .end local v0    # "graphObject":Lcom/facebook/model/GraphObject;
    :cond_18
    const-class v6, Lcom/facebook/model/GraphObjectList;

    invoke-virtual {v6, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_28

    move-object v1, p0

    .line 419
    check-cast v1, Lcom/facebook/model/GraphObjectList;

    .line 420
    .local v1, "graphObjectList":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<*>;"
    invoke-interface {v1}, Lcom/facebook/model/GraphObjectList;->getInnerJSONArray()Lorg/json/JSONArray;

    move-result-object v3

    goto :goto_3

    .line 421
    .end local v1    # "graphObjectList":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<*>;"
    :cond_28
    const-class v6, Ljava/lang/Iterable;

    invoke-virtual {v6, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_60

    .line 422
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .local v3, "jsonArray":Lorg/json/JSONArray;
    move-object v2, p0

    .line 423
    check-cast v2, Ljava/lang/Iterable;

    .line 424
    .local v2, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 425
    .local v4, "o":Ljava/lang/Object;
    const-class v7, Lcom/facebook/model/GraphObject;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 426
    check-cast v4, Lcom/facebook/model/GraphObject;

    .end local v4    # "o":Ljava/lang/Object;
    invoke-interface {v4}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3c

    .line 428
    .restart local v4    # "o":Ljava/lang/Object;
    :cond_5c
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3c

    .end local v2    # "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v4    # "o":Ljava/lang/Object;
    :cond_60
    move-object v3, p0

    .line 433
    goto :goto_3
.end method

.method private static declared-synchronized hasClassBeenVerified(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lcom/facebook/model/GraphObject$Factory;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/facebook/model/GraphObject$Factory;->verifiedGraphObjectClasses:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_b

    move-result v0

    monitor-exit v1

    return v0

    :catchall_b
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static hasSameId(Lcom/facebook/model/GraphObject;Lcom/facebook/model/GraphObject;)Z
    .registers 7
    .param p0, "a"    # Lcom/facebook/model/GraphObject;
    .param p1, "b"    # Lcom/facebook/model/GraphObject;

    .prologue
    const/4 v2, 0x0

    .line 176
    if-eqz p0, :cond_1d

    if-eqz p1, :cond_1d

    invoke-interface {p0}, Lcom/facebook/model/GraphObject;->asMap()Ljava/util/Map;

    move-result-object v3

    const-string v4, "id"

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {p1}, Lcom/facebook/model/GraphObject;->asMap()Ljava/util/Map;

    move-result-object v3

    const-string v4, "id"

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    .line 187
    :cond_1d
    :goto_1d
    return v2

    .line 179
    :cond_1e
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 180
    const/4 v2, 0x1

    goto :goto_1d

    .line 182
    :cond_26
    const-string v3, "id"

    invoke-interface {p0, v3}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 183
    .local v0, "idA":Ljava/lang/Object;
    const-string v3, "id"

    invoke-interface {p1, v3}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 184
    .local v1, "idB":Ljava/lang/Object;
    if-eqz v0, :cond_1d

    if-eqz v1, :cond_1d

    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_1d

    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_1d

    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_1d
.end method

.method private static declared-synchronized recordClassHasBeenVerified(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 243
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lcom/facebook/model/GraphObject$Factory;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/facebook/model/GraphObject$Factory;->verifiedGraphObjectClasses:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    .line 244
    monitor-exit v1

    return-void

    .line 243
    :catchall_a
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static verifyCanProxyClass(Ljava/lang/Class;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v10, 0x3

    .line 247
    invoke-static {p0}, Lcom/facebook/model/GraphObject$Factory;->hasClassBeenVerified(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 294
    :goto_7
    return-void

    .line 251
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-nez v6, :cond_27

    .line 252
    new-instance v6, Lcom/facebook/FacebookGraphObjectException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Factory can only wrap interfaces, not class: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 253
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 252
    invoke-direct {v6, v7}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 256
    :cond_27
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 257
    .local v3, "methods":[Ljava/lang/reflect/Method;
    array-length v8, v3

    const/4 v6, 0x0

    move v7, v6

    :goto_2e
    if-lt v7, v8, :cond_34

    .line 293
    invoke-static {p0}, Lcom/facebook/model/GraphObject$Factory;->recordClassHasBeenVerified(Ljava/lang/Class;)V

    goto :goto_7

    .line 257
    :cond_34
    aget-object v1, v3, v7

    .line 258
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 259
    .local v2, "methodName":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    array-length v4, v6

    .line 260
    .local v4, "parameterCount":I
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 261
    .local v5, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v6, Lcom/facebook/model/PropertyName;

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    .line 263
    .local v0, "hasPropertyNameOverride":Z
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    const-class v9, Lcom/facebook/model/GraphObject;

    invoke-virtual {v6, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_59

    .line 257
    :cond_55
    :goto_55
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_2e

    .line 266
    :cond_59
    const/4 v6, 0x1

    if-ne v4, v6, :cond_9c

    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v5, v6, :cond_9c

    .line 267
    if-eqz v0, :cond_8d

    .line 270
    const-class v6, Lcom/facebook/model/PropertyName;

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/facebook/model/PropertyName;

    invoke-interface {v6}, Lcom/facebook/model/PropertyName;->value()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 290
    :cond_74
    new-instance v6, Lcom/facebook/FacebookGraphObjectException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Factory can\'t proxy method: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 273
    :cond_8d
    const-string v6, "set"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_74

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v10, :cond_74

    goto :goto_55

    .line 277
    :cond_9c
    if-nez v4, :cond_74

    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v5, v6, :cond_74

    .line 278
    if-eqz v0, :cond_b7

    .line 281
    const-class v6, Lcom/facebook/model/PropertyName;

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/facebook/model/PropertyName;

    invoke-interface {v6}, Lcom/facebook/model/PropertyName;->value()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_74

    goto :goto_55

    .line 284
    :cond_b7
    const-string v6, "get"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_74

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v10, :cond_74

    goto :goto_55
.end method
