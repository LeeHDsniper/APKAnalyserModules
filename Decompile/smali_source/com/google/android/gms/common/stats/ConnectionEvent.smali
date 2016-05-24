.class public final Lcom/google/android/gms/common/stats/ConnectionEvent;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/common/stats/ConnectionEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field private final zzafj:J

.field private zzafk:I

.field private final zzafl:Ljava/lang/String;

.field private final zzafm:Ljava/lang/String;

.field private final zzafn:Ljava/lang/String;

.field private final zzafo:Ljava/lang/String;

.field private final zzafp:Ljava/lang/String;

.field private final zzafq:Ljava/lang/String;

.field private final zzafr:J

.field private final zzafs:J

.field private zzaft:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/common/stats/zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/ConnectionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .registers 20
    .param p1, "versionCode"    # I
    .param p2, "timeMillis"    # J
    .param p4, "eventType"    # I
    .param p5, "callingProcess"    # Ljava/lang/String;
    .param p6, "callingService"    # Ljava/lang/String;
    .param p7, "targetProcess"    # Ljava/lang/String;
    .param p8, "targetService"    # Ljava/lang/String;
    .param p9, "stackTrace"    # Ljava/lang/String;
    .param p10, "connKey"    # Ljava/lang/String;
    .param p11, "elapsedRealtime"    # J
    .param p13, "heapAlloc"    # J

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->mVersionCode:I

    iput-wide p2, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafj:J

    iput p4, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafk:I

    iput-object p5, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafl:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafm:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafn:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafo:Ljava/lang/String;

    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzaft:J

    iput-object p9, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafp:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafq:Ljava/lang/String;

    move-wide/from16 v0, p11

    iput-wide v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafr:J

    move-wide/from16 v0, p13

    iput-wide v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafs:J

    return-void
.end method

.method public constructor <init>(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .registers 30
    .param p1, "timeMillis"    # J
    .param p3, "eventType"    # I
    .param p4, "callingProcess"    # Ljava/lang/String;
    .param p5, "callingService"    # Ljava/lang/String;
    .param p6, "targetProcess"    # Ljava/lang/String;
    .param p7, "targetService"    # Ljava/lang/String;
    .param p8, "stackTrace"    # Ljava/lang/String;
    .param p9, "connKey"    # Ljava/lang/String;
    .param p10, "elapsedRealtime"    # J
    .param p12, "heapAlloc"    # J

    .prologue
    const/4 v2, 0x1

    move-object/from16 v1, p0

    move-wide/from16 v3, p1

    move/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-wide/from16 v12, p10

    move-wide/from16 v14, p12

    invoke-direct/range {v1 .. v15}, Lcom/google/android/gms/common/stats/ConnectionEvent;-><init>(IJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getEventType()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafk:I

    return v0
.end method

.method public getTimeMillis()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafj:J

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/common/stats/zza;->zza(Lcom/google/android/gms/common/stats/ConnectionEvent;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzpA()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafq:Ljava/lang/String;

    return-object v0
.end method

.method public zzpB()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafs:J

    return-wide v0
.end method

.method public zzpC()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafr:J

    return-wide v0
.end method

.method public zzpv()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafl:Ljava/lang/String;

    return-object v0
.end method

.method public zzpw()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafm:Ljava/lang/String;

    return-object v0
.end method

.method public zzpx()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafn:Ljava/lang/String;

    return-object v0
.end method

.method public zzpy()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafo:Ljava/lang/String;

    return-object v0
.end method

.method public zzpz()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/ConnectionEvent;->zzafp:Ljava/lang/String;

    return-object v0
.end method
