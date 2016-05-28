.class public final Lcom/squareup/okhttp/Headers;
.super Ljava/lang/Object;
.source "Headers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Headers$1;,
        Lcom/squareup/okhttp/Headers$Builder;
    }
.end annotation


# instance fields
.field private final namesAndValues:[Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Headers$Builder;)V
    .registers 4
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    # getter for: Lcom/squareup/okhttp/Headers$Builder;->namesAndValues:Ljava/util/List;
    invoke-static {p1}, Lcom/squareup/okhttp/Headers$Builder;->access$000(Lcom/squareup/okhttp/Headers$Builder;)Ljava/util/List;

    move-result-object v0

    # getter for: Lcom/squareup/okhttp/Headers$Builder;->namesAndValues:Ljava/util/List;
    invoke-static {p1}, Lcom/squareup/okhttp/Headers$Builder;->access$000(Lcom/squareup/okhttp/Headers$Builder;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    .line 52
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Headers$Builder;Lcom/squareup/okhttp/Headers$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/Headers$1;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Headers;-><init>(Lcom/squareup/okhttp/Headers$Builder;)V

    return-void
.end method

.method private static get([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "namesAndValues"    # [Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 134
    array-length v1, p0

    add-int/lit8 v0, v1, -0x2

    .local v0, "i":I
    :goto_3
    if-ltz v0, :cond_15

    .line 135
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 136
    add-int/lit8 v1, v0, 0x1

    aget-object v1, p0, v1

    .line 139
    :goto_11
    return-object v1

    .line 134
    :cond_12
    add-int/lit8 v0, v0, -0x2

    goto :goto_3

    .line 139
    :cond_15
    const/4 v1, 0x0

    goto :goto_11
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/squareup/okhttp/Headers;->get([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_b

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public name(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 80
    mul-int/lit8 v0, p1, 0x2

    .line 81
    .local v0, "nameIndex":I
    if-ltz v0, :cond_9

    iget-object v1, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_b

    .line 82
    :cond_9
    const/4 v1, 0x0

    .line 84
    :goto_a
    return-object v1

    :cond_b
    iget-object v1, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_a
.end method

.method public newBuilder()Lcom/squareup/okhttp/Headers$Builder;
    .registers 4

    .prologue
    .line 120
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 121
    .local v0, "result":Lcom/squareup/okhttp/Headers$Builder;
    # getter for: Lcom/squareup/okhttp/Headers$Builder;->namesAndValues:Ljava/util/List;
    invoke-static {v0}, Lcom/squareup/okhttp/Headers$Builder;->access$000(Lcom/squareup/okhttp/Headers$Builder;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v2

    if-ge v0, v2, :cond_2a

    .line 128
    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 130
    :cond_2a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public value(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 89
    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v0, v1, 0x1

    .line 90
    .local v0, "valueIndex":I
    if-ltz v0, :cond_b

    iget-object v1, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_d

    .line 91
    :cond_b
    const/4 v1, 0x0

    .line 93
    :goto_c
    return-object v1

    :cond_d
    iget-object v1, p0, Lcom/squareup/okhttp/Headers;->namesAndValues:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_c
.end method

.method public values(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    const/4 v1, 0x0

    .line 108
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    invoke-virtual {p0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v2

    if-ge v0, v2, :cond_24

    .line 109
    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 110
    if-nez v1, :cond_1a

    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 111
    .restart local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1a
    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 114
    :cond_24
    if-eqz v1, :cond_2b

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    :goto_2a
    return-object v2

    :cond_2b
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_2a
.end method
