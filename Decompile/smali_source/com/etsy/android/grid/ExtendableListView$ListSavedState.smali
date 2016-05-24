.class public Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
.super Lcom/etsy/android/grid/ClassLoaderSavedState;
.source "ExtendableListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListSavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/etsy/android/grid/ExtendableListView$ListSavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected firstId:J

.field protected height:I

.field protected position:I

.field protected selectedId:J

.field protected viewTop:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2653
    new-instance v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState$1;

    invoke-direct {v0}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState$1;-><init>()V

    .line 2652
    sput-object v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 2661
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 2623
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ClassLoaderSavedState;-><init>(Landroid/os/Parcel;)V

    .line 2624
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    .line 2625
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    .line 2626
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    .line 2627
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    .line 2628
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    .line 2629
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 3
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 2616
    const-class v0, Landroid/widget/AbsListView;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/ClassLoaderSavedState;-><init>(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 2617
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 2643
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ExtendableListView.ListSavedState{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2644
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2645
    const-string v1, " selectedId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2646
    const-string v1, " firstId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2647
    const-string v1, " viewTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2648
    const-string v1, " position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2649
    const-string v1, " height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2643
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 2633
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ClassLoaderSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2634
    iget-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 2635
    iget-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 2636
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2637
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2638
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2639
    return-void
.end method
