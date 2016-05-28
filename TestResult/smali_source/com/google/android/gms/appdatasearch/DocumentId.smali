.class public Lcom/google/android/gms/appdatasearch/DocumentId;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/appdatasearch/zzc;


# instance fields
.field final mVersionCode:I

.field final zzOZ:Ljava/lang/String;

.field final zzPa:Ljava/lang/String;

.field final zzPb:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/appdatasearch/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/DocumentId;->CREATOR:Lcom/google/android/gms/appdatasearch/zzc;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "versionCode"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "corpusName"    # Ljava/lang/String;
    .param p4, "uri"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzOZ:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzPa:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzPb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentId;->CREATOR:Lcom/google/android/gms/appdatasearch/zzc;

    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    const-string v0, "DocumentId[packageName=%s, corpusName=%s, uri=%s]"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzOZ:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzPa:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/appdatasearch/DocumentId;->zzPb:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentId;->CREATOR:Lcom/google/android/gms/appdatasearch/zzc;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/appdatasearch/zzc;->zza(Lcom/google/android/gms/appdatasearch/DocumentId;Landroid/os/Parcel;I)V

    return-void
.end method
