.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
.super Ljava/lang/Object;
.source "CdsUtils.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PackOptionWithPrice"
.end annotation


# instance fields
.field public option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

.field public price:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V
    .registers 3
    .param p1, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .prologue
    .line 148
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;)V

    .line 149
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;)V
    .registers 3
    .param p1, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    .param p2, "price"    # Ljava/lang/String;

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 161
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public static from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .registers 2
    .param p0, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .prologue
    .line 152
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    return-object v0
.end method

.method public static from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .registers 3
    .param p0, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    .line 156
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 166
    instance-of v2, p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    if-nez v2, :cond_6

    .line 170
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 169
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 170
    .local v0, "other":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->hashCode()I

    move-result v0

    add-int/lit16 v1, v0, 0x3e8

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_12
    add-int/2addr v0, v1

    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PackOptionWithPrice{ option: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", price: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
