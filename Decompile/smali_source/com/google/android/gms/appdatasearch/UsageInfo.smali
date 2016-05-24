.class public Lcom/google/android/gms/appdatasearch/UsageInfo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/appdatasearch/zzj;


# instance fields
.field final mVersionCode:I

.field final zzPP:Lcom/google/android/gms/appdatasearch/DocumentId;

.field final zzPQ:J

.field zzPR:I

.field final zzPS:Lcom/google/android/gms/appdatasearch/DocumentContents;

.field final zzPT:Z

.field zzPU:I

.field zzPV:I

.field public final zztM:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/appdatasearch/zzj;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zzj;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/UsageInfo;->CREATOR:Lcom/google/android/gms/appdatasearch/zzj;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/appdatasearch/DocumentId;JILjava/lang/String;Lcom/google/android/gms/appdatasearch/DocumentContents;ZII)V
    .registers 12
    .param p1, "versionCode"    # I
    .param p2, "documentId"    # Lcom/google/android/gms/appdatasearch/DocumentId;
    .param p3, "timestamp"    # J
    .param p5, "usageType"    # I
    .param p6, "query"    # Ljava/lang/String;
    .param p7, "document"    # Lcom/google/android/gms/appdatasearch/DocumentContents;
    .param p8, "isDeviceOnly"    # Z
    .param p9, "taskPosition"    # I
    .param p10, "eventStatus"    # I

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPP:Lcom/google/android/gms/appdatasearch/DocumentId;

    iput-wide p3, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPQ:J

    iput p5, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPR:I

    iput-object p6, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zztM:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPS:Lcom/google/android/gms/appdatasearch/DocumentContents;

    iput-boolean p8, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPT:Z

    iput p9, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPU:I

    iput p10, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPV:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    sget-object v0, Lcom/google/android/gms/appdatasearch/UsageInfo;->CREATOR:Lcom/google/android/gms/appdatasearch/zzj;

    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    const-string v0, "UsageInfo[documentId=%s, timestamp=%d, usageType=%d, status=%d]"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPP:Lcom/google/android/gms/appdatasearch/DocumentId;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v4, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPQ:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPR:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPV:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

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
    sget-object v0, Lcom/google/android/gms/appdatasearch/UsageInfo;->CREATOR:Lcom/google/android/gms/appdatasearch/zzj;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/appdatasearch/zzj;->zza(Lcom/google/android/gms/appdatasearch/UsageInfo;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzle()Lcom/google/android/gms/appdatasearch/DocumentContents;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzPS:Lcom/google/android/gms/appdatasearch/DocumentContents;

    return-object v0
.end method
