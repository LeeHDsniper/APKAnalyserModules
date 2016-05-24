.class Lcom/etsy/android/grid/ClassLoaderSavedState$2;
.super Ljava/lang/Object;
.source "ClassLoaderSavedState.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ClassLoaderSavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/etsy/android/grid/ClassLoaderSavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/etsy/android/grid/ClassLoaderSavedState;
    .registers 5
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 84
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    .line 85
    .local v0, "superState":Landroid/os/Parcelable;
    if-eqz v0, :cond_f

    .line 86
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "superState must be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_f
    sget-object v1, Lcom/etsy/android/grid/ClassLoaderSavedState;->EMPTY_STATE:Lcom/etsy/android/grid/ClassLoaderSavedState;

    return-object v1
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ClassLoaderSavedState$2;->createFromParcel(Landroid/os/Parcel;)Lcom/etsy/android/grid/ClassLoaderSavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/etsy/android/grid/ClassLoaderSavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 92
    new-array v0, p1, [Lcom/etsy/android/grid/ClassLoaderSavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ClassLoaderSavedState$2;->newArray(I)[Lcom/etsy/android/grid/ClassLoaderSavedState;

    move-result-object v0

    return-object v0
.end method
