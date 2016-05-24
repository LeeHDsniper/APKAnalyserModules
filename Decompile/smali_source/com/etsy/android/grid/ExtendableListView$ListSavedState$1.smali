.class Lcom/etsy/android/grid/ExtendableListView$ListSavedState$1;
.super Ljava/lang/Object;
.source "ExtendableListView.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
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
        "Lcom/etsy/android/grid/ExtendableListView$ListSavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 2653
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 2655
    new-instance v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    invoke-direct {v0, p1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 2659
    new-array v0, p1, [Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState$1;->newArray(I)[Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    move-result-object v0

    return-object v0
.end method
