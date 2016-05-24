.class final Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;
.super Ljava/util/AbstractList;
.source "GraphObject.java"

# interfaces
.implements Lcom/facebook/model/GraphObjectList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/model/GraphObject$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GraphObjectListImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<TT;>;",
        "Lcom/facebook/model/GraphObjectList",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final itemType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final state:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Ljava/lang/Class;)V
    .registers 4
    .param p1, "state"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 710
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p2, "itemType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 711
    const-string v0, "state"

    invoke-static {p1, v0}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 712
    const-string v0, "itemType"

    invoke-static {p2, v0}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 714
    iput-object p1, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    .line 715
    iput-object p2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    .line 716
    return-void
.end method

.method private checkIndex(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 824
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    if-ltz p1, :cond_a

    iget-object v0, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt p1, v0, :cond_10

    .line 825
    :cond_a
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 827
    :cond_10
    return-void
.end method

.method private put(ILjava/lang/Object;)V
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 830
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p2, "obj":Ljava/lang/Object;, "TT;"
    # invokes: Lcom/facebook/model/GraphObject$Factory;->getUnderlyingJSONObject(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p2}, Lcom/facebook/model/GraphObject$Factory;->access$2(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 832
    .local v1, "underlyingObject":Ljava/lang/Object;
    :try_start_4
    iget-object v2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v2, p1, v1}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_9} :catch_a

    .line 836
    return-void

    .line 833
    :catch_a
    move-exception v0

    .line 834
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 726
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p2, "object":Ljava/lang/Object;, "TT;"
    if-gez p1, :cond_8

    .line 727
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 728
    :cond_8
    invoke-virtual {p0}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->size()I

    move-result v0

    if-ge p1, v0, :cond_16

    .line 729
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only adding items at the end of the list is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 732
    :cond_16
    invoke-direct {p0, p1, p2}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->put(ILjava/lang/Object;)V

    .line 733
    return-void
.end method

.method public final castToListOf(Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TU;>;)",
            "Lcom/facebook/model/GraphObjectList",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 784
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p1, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TU;>;"
    const-class v1, Lcom/facebook/model/GraphObject;

    iget-object v2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 785
    iget-object v1, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 787
    move-object v0, p0

    .line 791
    :goto_13
    return-object v0

    :cond_14
    iget-object v1, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-static {v1, p1}, Lcom/facebook/model/GraphObject$Factory;->createList(Lorg/json/JSONArray;Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;

    move-result-object v0

    goto :goto_13

    .line 793
    :cond_1b
    new-instance v1, Lcom/facebook/FacebookGraphObjectException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Can\'t cast GraphObjectCollection of non-GraphObject type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 794
    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 793
    invoke-direct {v1, v2}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 805
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    const/4 v1, 0x0

    .line 751
    if-nez p1, :cond_4

    .line 760
    :cond_3
    :goto_3
    return v1

    .line 753
    :cond_4
    if-ne p0, p1, :cond_8

    .line 754
    const/4 v1, 0x1

    goto :goto_3

    .line 755
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    move-object v0, p1

    .line 759
    check-cast v0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;

    .line 760
    .local v0, "other":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    iget-object v1, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    iget-object v2, v0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public get(I)Ljava/lang/Object;
    .registers 6
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 766
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    invoke-direct {p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->checkIndex(I)V

    .line 768
    iget-object v2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v2, p1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    .line 772
    .local v1, "value":Ljava/lang/Object;
    iget-object v2, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/facebook/model/GraphObject$Factory;->coerceValueToExpectedType(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Object;

    move-result-object v0

    .line 774
    .local v0, "result":Ljava/lang/Object;, "TT;"
    return-object v0
.end method

.method public final getInnerJSONArray()Lorg/json/JSONArray;
    .registers 2

    .prologue
    .line 800
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    iget-object v0, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 746
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    iget-object v0, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->hashCode()I

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 810
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 820
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    .prologue
    .line 737
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    .local p2, "object":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->checkIndex(I)V

    .line 739
    invoke-virtual {p0, p1}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 740
    .local v0, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, p2}, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->put(ILjava/lang/Object;)V

    .line 741
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 779
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    iget-object v0, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 720
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;, "Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl<TT;>;"
    const-string v0, "GraphObjectList{itemType=%s, state=%s}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->itemType:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/facebook/model/GraphObject$Factory$GraphObjectListImpl;->state:Lorg/json/JSONArray;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
