.class final Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF$1;
.super Ljava/lang/Object;
.source "CircleF.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 254
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;-><init>()V

    .line 255
    .local v0, "r":Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->readFromParcel(Landroid/os/Parcel;)V

    .line 256
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 252
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF$1;->createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 260
    new-array v0, p1, [Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 252
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF$1;->newArray(I)[Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    move-result-object v0

    return-object v0
.end method
