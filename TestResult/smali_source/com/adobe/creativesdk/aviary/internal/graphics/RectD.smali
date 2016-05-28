.class public Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
.super Ljava/lang/Object;
.source "RectD.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/IGeom;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public bottom:D

.field public left:D

.field public right:D

.field public top:D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 551
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(DDDD)V
    .registers 10
    .param p1, "left"    # D
    .param p3, "top"    # D
    .param p5, "right"    # D
    .param p7, "bottom"    # D

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 43
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 44
    iput-wide p5, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 45
    iput-wide p7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V
    .registers 4
    .param p1, "r"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 55
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 56
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 57
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 58
    return-void
.end method


# virtual methods
.method public contains(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)Z
    .registers 6
    .param p1, "r"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    .line 329
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpg-double v0, v0, v2

    if-gez v0, :cond_32

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpg-double v0, v0, v2

    if-gez v0, :cond_32

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v2, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_32

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v2, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_32

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-wide v2, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_32

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-wide v2, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_32

    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 536
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 76
    if-ne p0, p1, :cond_5

    .line 84
    :cond_4
    :goto_4
    return v1

    .line 79
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 80
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 83
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 84
    .local v0, "r":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpl-double v3, v4, v6

    if-nez v3, :cond_36

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpl-double v3, v4, v6

    if-nez v3, :cond_36

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v3, v4, v6

    if-nez v3, :cond_36

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v3, v4, v6

    if-eqz v3, :cond_4

    :cond_36
    move v1, v2

    goto :goto_4
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 89
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->hashCode()I

    move-result v0

    .line 90
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 91
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 92
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 93
    return v0
.end method

.method public final height()D
    .registers 5

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    sub-double/2addr v0, v2

    return-wide v0
.end method

.method public inset(DD)V
    .registers 8
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .prologue
    .line 274
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 275
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    add-double/2addr v0, p3

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 276
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double/2addr v0, p1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 277
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double/2addr v0, p3

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 278
    return-void
.end method

.method public offset(DD)V
    .registers 8
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .prologue
    .line 247
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 248
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    add-double/2addr v0, p3

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 249
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 250
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    add-double/2addr v0, p3

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 251
    return-void
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 576
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 577
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 578
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 579
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 580
    return-void
.end method

.method public set(DDDD)V
    .registers 10
    .param p1, "left"    # D
    .param p3, "top"    # D
    .param p5, "right"    # D
    .param p7, "bottom"    # D

    .prologue
    .line 198
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 199
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 200
    iput-wide p5, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 201
    iput-wide p7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 202
    return-void
.end method

.method public set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V
    .registers 4
    .param p1, "src"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    .line 222
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 223
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 224
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 225
    iget-wide v0, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 226
    return-void
.end method

.method public sort()V
    .registers 7

    .prologue
    .line 520
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v2, v2, v4

    if-lez v2, :cond_10

    .line 521
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 522
    .local v0, "temp":D
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 523
    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 525
    .end local v0    # "temp":D
    :cond_10
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v2, v2, v4

    if-lez v2, :cond_20

    .line 526
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 527
    .restart local v0    # "temp":D
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 528
    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 530
    .end local v0    # "temp":D
    :cond_20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RectD("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final width()D
    .registers 5

    .prologue
    .line 154
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    sub-double/2addr v0, v2

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 545
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 546
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 547
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 548
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 549
    return-void
.end method
