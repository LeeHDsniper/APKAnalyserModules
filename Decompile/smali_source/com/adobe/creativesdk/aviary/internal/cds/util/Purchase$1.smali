.class final Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase$1;
.super Ljava/lang/Object;
.source "Purchase.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
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
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 39
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase$1;->createFromParcel(Landroid/os/Parcel;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 44
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase$1;->newArray(I)[Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    move-result-object v0

    return-object v0
.end method
