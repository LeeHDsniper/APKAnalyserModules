.class public Lcom/google/android/gms/appdatasearch/DocumentContents;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/appdatasearch/zzb;


# instance fields
.field public final account:Landroid/accounts/Account;

.field final mVersionCode:I

.field final zzOS:[Lcom/google/android/gms/appdatasearch/DocumentSection;

.field public final zzOT:Ljava/lang/String;

.field public final zzOU:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/appdatasearch/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/DocumentContents;->CREATOR:Lcom/google/android/gms/appdatasearch/zzb;

    return-void
.end method

.method constructor <init>(I[Lcom/google/android/gms/appdatasearch/DocumentSection;Ljava/lang/String;ZLandroid/accounts/Account;)V
    .registers 6
    .param p1, "versionCode"    # I
    .param p2, "sectionContents"    # [Lcom/google/android/gms/appdatasearch/DocumentSection;
    .param p3, "schemaOrgType"    # Ljava/lang/String;
    .param p4, "globalSearchEnabled"    # Z
    .param p5, "account"    # Landroid/accounts/Account;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzOS:[Lcom/google/android/gms/appdatasearch/DocumentSection;

    iput-object p3, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzOT:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzOU:Z

    iput-object p5, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->account:Landroid/accounts/Account;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentContents;->CREATOR:Lcom/google/android/gms/appdatasearch/zzb;

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentContents;->CREATOR:Lcom/google/android/gms/appdatasearch/zzb;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/appdatasearch/zzb;->zza(Lcom/google/android/gms/appdatasearch/DocumentContents;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzbu(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/DocumentSection;
    .registers 8

    const/4 v0, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzOS:[Lcom/google/android/gms/appdatasearch/DocumentSection;

    if-nez v1, :cond_9

    :cond_8
    :goto_8
    return-object v0

    :cond_9
    iget-object v3, p0, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzOS:[Lcom/google/android/gms/appdatasearch/DocumentSection;

    array-length v4, v3

    const/4 v1, 0x0

    move v2, v1

    :goto_e
    if-ge v2, v4, :cond_8

    aget-object v1, v3, v2

    invoke-virtual {v1}, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzkZ()Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    move-object v0, v1

    goto :goto_8

    :cond_20
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_e
.end method

.method public zzkX()Ljava/lang/String;
    .registers 2

    const-string v0, "web_url"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzbu(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/DocumentSection;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v0, v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
