.class Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;
.super Ljava/lang/Object;
.source "Request.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParcelFileDescriptorWithMimeType"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final fileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private final mimeType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2426
    new-instance v0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType$1;

    invoke-direct {v0}, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType$1;-><init>()V

    .line 2425
    sput-object v0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 2434
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 2441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2442
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->mimeType:Ljava/lang/String;

    .line 2443
    invoke-virtual {p1}, Landroid/os/Parcel;->readFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->fileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 2444
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;)V
    .registers 3

    .prologue
    .line 2441
    invoke-direct {p0, p1}, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 2416
    const/4 v0, 0x1

    return v0
.end method

.method public getFileDescriptor()Landroid/os/ParcelFileDescriptor;
    .registers 2

    .prologue
    .line 2412
    iget-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->fileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2408
    iget-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 2420
    iget-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->mimeType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 2421
    iget-object v0, p0, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->fileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFileDescriptor(Ljava/io/FileDescriptor;)V

    .line 2422
    return-void
.end method
