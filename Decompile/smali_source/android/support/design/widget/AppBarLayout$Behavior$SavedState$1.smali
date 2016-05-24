.class final Landroid/support/design/widget/AppBarLayout$Behavior$SavedState$1;
.super Ljava/lang/Object;
.source "AppBarLayout.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
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
        "Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 966
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 969
    new-instance v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    invoke-direct {v0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 966
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 974
    new-array v0, p1, [Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 966
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState$1;->newArray(I)[Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    move-result-object v0

    return-object v0
.end method
