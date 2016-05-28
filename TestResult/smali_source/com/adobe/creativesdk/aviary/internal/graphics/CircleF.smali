.class public Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
.super Ljava/lang/Object;
.source "CircleF.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/IGeom;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected radius:F

.field protected x:F

.field protected y:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 252
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0, v0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;-><init>(FFF)V

    .line 20
    return-void
.end method

.method public constructor <init>(FFF)V
    .registers 4
    .param p1, "centerx"    # F
    .param p2, "centery"    # F
    .param p3, "r"    # F

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    .line 24
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    .line 25
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    .line 26
    return-void
.end method


# virtual methods
.method public centerX()F
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    return v0
.end method

.method public centerY()F
    .registers 2

    .prologue
    .line 44
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    return v0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 206
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 234
    if-ne p0, p1, :cond_5

    .line 247
    :cond_4
    :goto_4
    return v1

    .line 237
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 238
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 241
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    .line 245
    .local v0, "r":Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iget v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    .line 246
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iget v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    .line 247
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iget v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_4c
    move v1, v2

    goto :goto_4
.end method

.method public getRadius()F
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 225
    const/4 v0, 0x7

    .line 226
    .local v0, "hash":I
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x1f1

    .line 227
    mul-int/lit8 v1, v0, 0x47

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 228
    mul-int/lit8 v1, v0, 0x47

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 229
    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 218
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    .line 219
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    .line 220
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    .line 221
    return-void
.end method

.method public set(FFF)V
    .registers 4
    .param p1, "cx"    # F
    .param p2, "cy"    # F
    .param p3, "r"    # F

    .prologue
    .line 29
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    .line 30
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    .line 31
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    .line 32
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CircleF("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", r="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 211
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->x:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 212
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->y:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 213
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->radius:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 214
    return-void
.end method
