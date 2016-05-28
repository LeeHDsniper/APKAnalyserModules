.class public Lcom/google/android/gms/appdatasearch/DocumentSection;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/appdatasearch/zzd;

.field public static final zzPc:I

.field private static final zzPd:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;


# instance fields
.field final mVersionCode:I

.field public final zzPe:Ljava/lang/String;

.field final zzPf:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

.field public final zzPg:I

.field public final zzPh:[B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "-1"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPc:I

    new-instance v0, Lcom/google/android/gms/appdatasearch/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->CREATOR:Lcom/google/android/gms/appdatasearch/zzd;

    new-instance v0, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;

    const-string v1, "SsbContext"

    invoke-direct {v0, v1}, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;->zzM(Z)Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;

    move-result-object v0

    const-string v1, "blob"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;->zzby(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/appdatasearch/RegisterSectionInfo$zza;->zzld()Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPd:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;I[B)V
    .registers 9
    .param p1, "versionCode"    # I
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "sectionInfo"    # Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;
    .param p4, "globalSearchSectionType"    # I
    .param p5, "blobContent"    # [B

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPc:I

    if-eq p4, v0, :cond_d

    invoke-static {p4}, Lcom/google/android/gms/appdatasearch/zzh;->zzaj(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3a

    :cond_d
    const/4 v0, 0x1

    :goto_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid section type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iput p1, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPf:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    iput p4, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPg:I

    iput-object p5, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPh:[B

    invoke-virtual {p0}, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzla()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3c

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3a
    const/4 v0, 0x0

    goto :goto_e

    :cond_3c
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->CREATOR:Lcom/google/android/gms/appdatasearch/zzd;

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->CREATOR:Lcom/google/android/gms/appdatasearch/zzd;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/appdatasearch/zzd;->zza(Lcom/google/android/gms/appdatasearch/DocumentSection;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzkZ()Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPf:Lcom/google/android/gms/appdatasearch/RegisterSectionInfo;

    return-object v0
.end method

.method public zzla()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPg:I

    sget v1, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPc:I

    if-eq v0, v1, :cond_24

    iget v0, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPg:I

    invoke-static {v0}, Lcom/google/android/gms/appdatasearch/zzh;->zzaj(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_24

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid section type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPg:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_23
    return-object v0

    :cond_24
    iget-object v0, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPh:[B

    if-eqz v0, :cond_2f

    const-string v0, "Both content and blobContent set"

    goto :goto_23

    :cond_2f
    const/4 v0, 0x0

    goto :goto_23
.end method
