.class final Lcom/adobe/creativesdk/aviary/internal/graphics/LineF$1;
.super Ljava/lang/Object;
.source "LineF.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
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
        "Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 218
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;-><init>()V

    .line 219
    .local v0, "r":Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->readFromParcel(Landroid/os/Parcel;)V

    .line 220
    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF$1;->createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 224
    new-array v0, p1, [Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF$1;->newArray(I)[Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    move-result-object v0

    return-object v0
.end method
