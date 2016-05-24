.class Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
.super Ljava/lang/Object;
.source "StaggeredGridLayoutManager.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FullSpanItem"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mGapDir:I

.field mGapPerSpan:[I

.field mHasUnwantedGapAfter:Z

.field mPosition:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2656
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem$1;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem$1;-><init>()V

    sput-object v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2617
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2618
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 5
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    .line 2606
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2607
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    .line 2608
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    .line 2609
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-ne v2, v1, :cond_28

    :goto_16
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mHasUnwantedGapAfter:Z

    .line 2610
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 2611
    .local v0, "spanCount":I
    if-lez v0, :cond_27

    .line 2612
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    .line 2613
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readIntArray([I)V

    .line 2615
    :cond_27
    return-void

    .line 2609
    .end local v0    # "spanCount":I
    :cond_28
    const/4 v1, 0x0

    goto :goto_16
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 2630
    const/4 v0, 0x0

    return v0
.end method

.method getGapForSpan(I)I
    .registers 3
    .param p1, "spanIndex"    # I

    .prologue
    .line 2621
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    aget v0, v0, p1

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2648
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FullSpanItem{mPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mGapDir="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mHasUnwantedGapAfter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mHasUnwantedGapAfter:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mGapPerSpan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 2635
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2636
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2637
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mHasUnwantedGapAfter:Z

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    :goto_10
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2638
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    if-eqz v0, :cond_2a

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    array-length v0, v0

    if-lez v0, :cond_2a

    .line 2639
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    array-length v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2640
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 2644
    :goto_27
    return-void

    :cond_28
    move v0, v1

    .line 2637
    goto :goto_10

    .line 2642
    :cond_2a
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_27
.end method
