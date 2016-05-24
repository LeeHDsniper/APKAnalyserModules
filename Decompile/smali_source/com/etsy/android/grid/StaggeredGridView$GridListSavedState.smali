.class public Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;
.super Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
.source "StaggeredGridView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/StaggeredGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GridListSavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field columnCount:I

.field columnTops:[I

.field positionData:Landroid/util/SparseArray;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1286
    new-instance v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState$1;

    invoke-direct {v0}, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState$1;-><init>()V

    .line 1285
    sput-object v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1294
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 1264
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;-><init>(Landroid/os/Parcel;)V

    .line 1265
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    .line 1266
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    if-ltz v0, :cond_25

    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    :goto_f
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    .line 1267
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    .line 1268
    const-class v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readSparseArray(Ljava/lang/ClassLoader;)Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->positionData:Landroid/util/SparseArray;

    .line 1269
    return-void

    .line 1266
    :cond_25
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 1257
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1258
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1281
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StaggeredGridView.GridListSavedState{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1282
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1281
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 1273
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 1274
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1275
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 1276
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->positionData:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSparseArray(Landroid/util/SparseArray;)V

    .line 1277
    return-void
.end method
