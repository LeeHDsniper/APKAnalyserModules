.class public Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
.super Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "StaggeredItemEntry"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private height:I

.field private final span:I

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "startLane"    # I
    .param p2, "anchorLane"    # I
    .param p3, "span"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;-><init>(II)V

    .line 48
    iput p3, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;-><init>(Landroid/os/Parcel;)V

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I

    .line 56
    return-void
.end method

.method static synthetic access$000(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .prologue
    .line 41
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I

    return v0
.end method

.method static synthetic access$100(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .prologue
    .line 41
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I

    return v0
.end method

.method static synthetic access$102(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;I)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I

    return p1
.end method

.method static synthetic access$200(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .prologue
    .line 41
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I

    return v0
.end method

.method static synthetic access$202(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;I)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I

    return p1
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 60
    invoke-super {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->writeToParcel(Landroid/os/Parcel;I)V

    .line 61
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 62
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 63
    iget v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    return-void
.end method
