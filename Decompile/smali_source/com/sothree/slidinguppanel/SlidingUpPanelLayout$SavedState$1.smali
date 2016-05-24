.class final Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState$1;
.super Ljava/lang/Object;
.source "SlidingUpPanelLayout.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;
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
        "Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1314
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 1317
    new-instance v0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;-><init>(Landroid/os/Parcel;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1314
    invoke-virtual {p0, p1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 1322
    new-array v0, p1, [Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1314
    invoke-virtual {p0, p1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState$1;->newArray(I)[Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;

    move-result-object v0

    return-object v0
.end method
