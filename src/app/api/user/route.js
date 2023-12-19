import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function POST(req, res) {
    try {
        const Prisma = new PrismaClient()
        const PostBody = req.json()
        const Result = await Prisma.users.createMany({
            data: PostBody
        })
        return NextResponse.json({status: "success", data: Result });
    } 
    catch (error) {
        return NextResponse.json({ status: "fail", msg: error.toString() }); 
    }

}

export async function GET() {
    try {
      
      const Prisma = new PrismaClient();
  
      const result = await Prisma.users.findMany(
        //   {
        //     select: {name:true, city:true, salary:true },
        //     where : {city : 'Dhaka'},
        //     skip: 3,
        //     take: 5,
        //   }
        );
  
      return NextResponse.json({status: "success", Total: result.length, data: result });

    } 
    catch (error) {
      return NextResponse.json({ status: "fail", msg: error.toString() });
    }
  }