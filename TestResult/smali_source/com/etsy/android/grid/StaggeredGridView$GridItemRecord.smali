.class Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
.super Ljava/lang/Object;
.source "StaggeredGridView.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/StaggeredGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GridItemRecord"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field column:I

.field heightRatio:D

.field isHeaderFooter:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 111
    new-instance v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord$1;

    invoke-direct {v0}, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord$1;-><init>()V

    .line 110
    sput-object v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 119
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-ne v1, v0, :cond_19

    :goto_16
    iput-boolean v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->isHeaderFooter:Z

    .line 86
    return-void

    .line 85
    :cond_19
    const/4 v0, 0x0

    goto :goto_16
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;)V
    .registers 3

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 90
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GridItemRecord.ListSavedState{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 104
    const-string v1, " column:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 105
    const-string v1, " heightRatio:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 106
    const-string v1, " isHeaderFooter:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->isHeaderFooter:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 107
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 95
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 96
    iget-wide v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 97
    iget-boolean v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->isHeaderFooter:Z

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_f
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 98
    return-void

    .line 97
    :cond_14
    const/4 v0, 0x0

    goto :goto_f
.end method
