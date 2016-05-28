.class public Lcom/google/android/gms/common/data/BitmapTeleporter;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/common/data/BitmapTeleporter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field zzEo:Landroid/os/ParcelFileDescriptor;

.field final zzUS:I

.field private zzaba:Landroid/graphics/Bitmap;

.field private zzabb:Z

.field private zzabc:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/common/data/zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/data/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/data/BitmapTeleporter;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/os/ParcelFileDescriptor;I)V
    .registers 5
    .param p1, "versionCode"    # I
    .param p2, "parcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "type"    # I

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    iput p3, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzUS:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzaba:Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzabb:Z

    return-void
.end method

.method private zza(Ljava/io/Closeable;)V
    .registers 5

    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    :goto_3
    return-void

    :catch_4
    move-exception v0

    const-string v1, "BitmapTeleporter"

    const-string v2, "Could not close stream"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method

.method private zznR()Ljava/io/FileOutputStream;
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzabc:Ljava/io/File;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setTempDir() must be called before writing this object to a parcel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    :try_start_c
    const-string v0, "teleporter"

    const-string v1, ".tmp"

    iget-object v2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzabc:Ljava/io/File;

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_15} :catch_27

    move-result-object v0

    :try_start_16
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/high16 v2, 0x10000000

    invoke-static {v0, v2}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;
    :try_end_23
    .catch Ljava/io/FileNotFoundException; {:try_start_16 .. :try_end_23} :catch_30

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-object v1

    :catch_27
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Could not create temporary file"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_30
    move-exception v0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Temporary file is somehow already deleted"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 7
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    if-nez v0, :cond_46

    iget-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzaba:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-direct {p0}, Lcom/google/android/gms/common/data/BitmapTeleporter;->zznR()Ljava/io/FileOutputStream;

    move-result-object v2

    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    :try_start_23
    array-length v2, v1

    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap$Config;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_43} :catch_4f
    .catchall {:try_start_23 .. :try_end_43} :catchall_58

    invoke-direct {p0, v3}, Lcom/google/android/gms/common/data/BitmapTeleporter;->zza(Ljava/io/Closeable;)V

    :cond_46
    or-int/lit8 v0, p2, 0x1

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/common/data/zza;->zza(Lcom/google/android/gms/common/data/BitmapTeleporter;Landroid/os/Parcel;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    return-void

    :catch_4f
    move-exception v0

    :try_start_50
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Could not write into unlinked file"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_58
    .catchall {:try_start_50 .. :try_end_58} :catchall_58

    :catchall_58
    move-exception v0

    invoke-direct {p0, v3}, Lcom/google/android/gms/common/data/BitmapTeleporter;->zza(Ljava/io/Closeable;)V

    throw v0
.end method
