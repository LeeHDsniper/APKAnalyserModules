.class public Landroid/support/design/widget/CoordinatorLayout$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "CoordinatorLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/CoordinatorLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/support/design/widget/CoordinatorLayout$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field behaviorStates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2604
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$SavedState$1;

    invoke-direct {v0}, Landroid/support/design/widget/CoordinatorLayout$SavedState$1;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 9
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 2565
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 2567
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 2569
    .local v2, "size":I
    new-array v1, v2, [I

    .line 2570
    .local v1, "ids":[I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readIntArray([I)V

    .line 2572
    const-class v4, Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v3

    .line 2575
    .local v3, "states":[Landroid/os/Parcelable;
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4, v2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    .line 2576
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    if-ge v0, v2, :cond_2c

    .line 2577
    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    aget v5, v1, v0

    aget-object v6, v3, v0

    invoke-virtual {v4, v5, v6}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 2576
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 2579
    :cond_2c
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 2582
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 2583
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 8
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 2587
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2589
    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    if-eqz v4, :cond_2c

    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 2590
    .local v2, "size":I
    :goto_d
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 2592
    new-array v1, v2, [I

    .line 2593
    .local v1, "ids":[I
    new-array v3, v2, [Landroid/os/Parcelable;

    .line 2595
    .local v3, "states":[Landroid/os/Parcelable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-ge v0, v2, :cond_2e

    .line 2596
    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    aput v4, v1, v0

    .line 2597
    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Parcelable;

    aput-object v4, v3, v0

    .line 2595
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 2589
    .end local v0    # "i":I
    .end local v1    # "ids":[I
    .end local v2    # "size":I
    .end local v3    # "states":[Landroid/os/Parcelable;
    :cond_2c
    const/4 v2, 0x0

    goto :goto_d

    .line 2599
    .restart local v0    # "i":I
    .restart local v1    # "ids":[I
    .restart local v2    # "size":I
    .restart local v3    # "states":[Landroid/os/Parcelable;
    :cond_2e
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 2600
    invoke-virtual {p1, v3, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    .line 2602
    return-void
.end method
